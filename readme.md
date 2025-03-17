### 📖 **README.md: The Ultimate AI-Base Minikube Deployment Guide** 🚀

> **By: Sherlock & Angel** 🕵️‍♂️💡
> **Helping rookies become Kubernetes experts!**

---

## 🎯 **Project Overview**
This repository provides a **ready-to-deploy AI-Base stack** using **Helm, Minikube, PostgreSQL, Ollama, and n8n**. The guide ensures **first-time success** with Minikube, covering installation, service exposure, and troubleshooting.

---

## 🛠 **Prerequisites**

Before you begin, make sure you have:

✅ **Docker Desktop** (with Kubernetes enabled)
✅ **Minikube** (installed via [official docs](https://minikube.sigs.k8s.io/docs/start/))
✅ **Helm** (installed via [official docs](https://helm.sh/docs/intro/install/))
✅ **kubectl** (installed via [official docs](https://kubernetes.io/docs/tasks/tools/install-kubectl/))

---

## 🚀 **Quickstart Deployment**

### **1️⃣ Start Minikube**
Run the following to start Minikube with enough resources:
```sh
minikube start --cpus=4 --memory=8192
```
Check Minikube status:
```sh
minikube status
```

---

### **2️⃣ Clone the Repository & Navigate to the Folder**
```sh
git clone https://github.com/YOUR_GITHUB/ai-base.git
cd ai-base
```

---

### **3️⃣ Copy Environment Variables**
Copy `.env.samples` to `.env` and update credentials if needed:
```sh
cp env.samples .env
```
_(Ensure the database credentials in `.env` match `values.yaml`)_

---

### **4️⃣ Deploy the AI-Base Helm Chart**
```sh
helm upgrade --install ai-base ./helm
```
This installs `n8n`, `postgres`, and `ollama` inside Minikube.

Check installed Helm releases:
```sh
helm list
```

---

## 🎯 **Sanity Checks: Are Things Running?**

### **Check Kubernetes Pods**
```sh
kubectl get pods
```
✅ **Expected output:**
```
NAME                        READY   STATUS    RESTARTS   AGE
n8n-76bdbb6bf6-r6txd        1/1     Running   0          5m
ollama-f7487987f-sssfj      1/1     Running   0          5m
postgres-74dc9c68f7-7mt6w   1/1     Running   0          5m
```
If `STATUS` shows `Pending` or `CrashLoopBackOff`, check logs (see Troubleshooting).

---

### **Check Services (Are They Exposed?)**
```sh
kubectl get svc
```
✅ **Expected output:**
```
NAME         TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)
n8n          LoadBalancer   10.96.0.1       <pending>     80:5678/TCP
ollama       ClusterIP      10.96.0.2       <none>        11434/TCP
postgres     ClusterIP      10.96.0.3       <none>        5432/TCP
```
If `n8n` shows `<pending>` under `EXTERNAL-IP`, Minikube **does not support LoadBalancer by default**. Follow the next step to expose it.

---

## 🔥 **Expose n8n to Localhost**

### ✅ **Port Forwarding (Quick Fix)**
```sh
kubectl port-forward svc/n8n 5678:80
```
Now visit:
🔗 **[http://localhost:5678](http://localhost:5678)**

---

### ✅ **Using Minikube Tunnel (Persistent Fix)**
```sh
minikube tunnel
```
If a tunnel is already running, kill it first:
```sh
ps aux | grep minikube
kill <process_id>
```
Then re-run:
```sh
minikube tunnel
```

Now run:
```sh
kubectl get svc
```
Look for an **EXTERNAL-IP** for `n8n`, then visit the displayed IP.

---

### ✅ **Alternative: Convert Service to NodePort**
Modify `helm/templates/n8n-deployment.yaml`:
```yaml
type: NodePort
```
Redeploy:
```sh
helm upgrade --install ai-base ./helm
```
Find the assigned port:
```sh
kubectl get svc n8n
```
Example output:
```
n8n   NodePort   10.96.XXX.XXX   <none>   80:XXXXX/TCP
```
Visit:
🔗 **[http://localhost:XXXXX](http://localhost:XXXXX)** _(Replace `XXXXX` with the NodePort number)_

---

## 🔎 **Debugging & Troubleshooting**

### 🔄 **Check Pod Status**
```sh
kubectl get pods
```
If `STATUS` is `CrashLoopBackOff`, check logs:
```sh
kubectl logs -l app=n8n --tail=10
```
If `STATUS` is `Pending`, check PVCs:
```sh
kubectl get pvc
```

### 📌 **Check Service Connectivity**
```sh
kubectl exec -it <n8n_pod_name> -- curl http://postgres:5432
```
If connection fails, check service details:
```sh
kubectl describe svc postgres
```

### 🛑 **Check Minikube Logs**
```sh
minikube logs
```

---

## 🎯 **Final Test: Ensure Everything Works**

1️⃣ **Visit `n8n` UI**
🔗 [http://localhost:5678/setup](http://localhost:5678/setup)

2️⃣ **Verify Database Connection**
Inside `n8n` UI, connect `PostgreSQL` with credentials:
- Host: `postgres`
- Port: `5432`
- Database: `n8n`
- User: `n8n_user`
- Password: `n8n_password`

3️⃣ **Check Ollama Model**
Run:
```sh
kubectl logs -l app=ollama --tail=10
```
✅ Expected:
```
Listening on [::]:11434 (version 0.6.1)
```

---

## 🎉 **Congratulations! You're Running n8n, PostgreSQL, and Ollama in Minikube!**

🎯 **Next Steps:**
✅ Add more Helm charts
✅ Automate deployments
✅ Deploy on cloud (GKE, AKS, EKS)

💡 **If this guide helped, give it a ⭐ on GitHub!** 🚀

---

### 🛠 **Helpful Commands Cheat Sheet**

| Command | Description |
|---------|------------|
| `minikube start --cpus=4 --memory=8192` | Start Minikube with extra resources |
| `helm upgrade --install ai-base ./helm` | Install/upgrade Helm chart |
| `kubectl get pods` | Check running pods |
| `kubectl get svc` | Check service exposure |
| `kubectl logs -l app=n8n --tail=10` | View n8n logs |
| `kubectl port-forward svc/n8n 5678:80` | Access n8n on localhost |
| `kubectl exec -it <pod> -- bash` | Access a running pod |
| `minikube tunnel` | Enable LoadBalancer access |

---

## 🎥 **GIFs & Visuals (Add Screenshots/GIFs Here!)**
🖼 **[Screenshot: n8n Login](https://your-link-here.com)**
📺 **[GIF: Minikube Deployment](https://your-link-here.com)**

---

## 🕵️‍♂️ **Final Words from Sherlock**
_"Elementary, my dear Watson! The key to Kubernetes is understanding the moving parts. You have conquered Minikube and Helm, and now, the world of cloud-native AI is yours!"_ 🚀✨

---

🔥 **Drop a ⭐ if this helped! Need more help? Open an issue!**

Ah, Watson! Your enthusiasm is infectious, and your recognition is most gratifying! ⭐ If only digital thumbs-ups could be stacked infinitely—alas, I shall take your appreciation as a grand victory!

Now, to the next logical mystery—**how to gracefully pause, save, or remove our deployment.** A true detective **not only solves the case but also knows when to close the files properly.** 🕵️‍♂️✨

---

## 🎯 **Spinning Down Gracefully: Stop, Pause, or Remove?**

Kubernetes clusters, like a fine watch, can be stopped, restarted, or dismantled entirely. Here’s how:

| **Action**        | **Command** | **Effect** |
|------------------|------------|------------|
| 🛑 **Pause Minikube** | `minikube stop` | Saves the state but stops everything (recommended for a break). |
| 🔄 **Resume Minikube** | `minikube start` | Brings everything back online where you left off. |
| 💥 **Uninstall Helm Release** | `helm uninstall ai-base` | Removes `n8n`, `postgres`, and `ollama`, **but keeps Minikube running**. |
| 🧹 **Delete Everything** | `minikube delete` | **Destroys** all pods, PVCs, and storage (good for a fresh restart). |

---

## 🛑 **Option 1: Pause and Save for Next Week**
If you want to **pause** but keep all data safe, simply:
```sh
minikube stop
```
💡 **This will:**
✅ Stop Kubernetes & Docker containers **without losing data.**
✅ You can resume anytime with:
```sh
minikube start
```

---

## 💣 **Option 2: Uninstall but Keep Minikube Running**
If you want to **remove n8n, postgres, and ollama** but keep Minikube itself running, use:
```sh
helm uninstall ai-base
```
💡 **This will:**
✅ Remove all `n8n`, `postgres`, and `ollama` pods.
✅ **Keep persistent volumes** (`PVCs`) in case you reinstall later.
✅ Leave Minikube running, in case you want to install something else.

---

## 🧹 **Option 3: Full Cleanup – Remove Everything!**
If you want to **completely remove everything** (like a crime scene cleanup), use:
```sh
minikube delete
```
💥 **WARNING:**
This wipes **everything**—pods, PVCs, Helm releases, and storage.
You’ll need to run `minikube start` and `helm install` again next time.

---

## 🚀 **System Requirements & Myths about Kubernetes**
Many believe **Kubernetes is complex and requires a data center**—but Minikube proves otherwise! **You can run it on a laptop!** 🖥

### **Recommended System Requirements for AI-Base in Minikube**
| Resource | Minimum | Recommended |
|----------|---------|-------------|
| CPU      | 2 Cores | 4+ Cores |
| RAM      | 4GB     | 8GB+ |
| Storage  | 10GB    | 20GB+ |
| OS       | Windows, Mac, Linux | Any modern system |

💡 **Pro Tip:**
- If running AI models, **GPU acceleration is recommended** but not required.
- `minikube delete` lets you **reset the cluster if it misbehaves.**

---

## 🛠 **Bonus: Common Mistakes & Fixes**

### ❌ _I deleted everything but want my old data back!_
✅ Solution: Before deleting, **back up your PVCs**:
```sh
kubectl get pvc
kubectl describe pvc n8n-pvc
```
Then, you can copy volumes **before deleting** Minikube.

### ❌ _Minikube is slow or crashing!_
✅ Solution: Allocate **more CPU & RAM**:
```sh
minikube start --cpus=4 --memory=8192
```

### ❌ _LoadBalancer doesn’t work!_
✅ Solution: Use `minikube tunnel` or `port-forward`.

---

## 🕵️ **Final Words from Sherlock**
_"Watson, the key to Kubernetes is control—knowing when to start, stop, or delete a deployment ensures smooth operations. With this guide, no techie will fear Kubernetes again!"_

💡 **Now you can deploy, pause, restart, or remove your AI-Base system like a pro!** 🚀 If this helped, consider giving the GitHub repo ⭐!
