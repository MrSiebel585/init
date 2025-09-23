# init - base installer scripts for digital forensics based linux commands scripts and supporting modules that can be refactored and consistently updated with revision control using an ai pipeline from omniscientctl and executed 


Here’s a unified documentation framework for your ecosystem of repos:

Omniscient → Core AI forensics & OSINT framework

Global → Shared utilities, scripts, modules

Control → System management & orchestration

Init → Bootstrap & setup layer

You can use this as a master docs index, and each repo keeps its own README.md but points back to this unified structure.

Omniscient Ecosystem Documentation
Overview

The Omniscient Ecosystem is a modular AI-driven framework for digital forensics, OSINT, and system automation.
It is composed of four tightly integrated repositories:

Init – bootstrap & setup layer (provisions environment, dependencies, configs).

Global – shared modules, utilities, scripts across the ecosystem.

Control – orchestration & management CLI (service management, RBAC, task execution).

Omniscient – the core AI forensics & OSINT framework (analysis, pipelines, dashboards).

Architecture
┌───────────────┐
│     Init       │  →  Sets up environment, installs dependencies
└──────┬────────┘
       │
┌──────▼────────┐
│    Global      │  →  Provides utilities, scripts, shared AI modules
└──────┬────────┘
       │
┌──────▼────────┐
│    Control     │  →  Unified CLI, RBAC, orchestration layer
└──────┬────────┘
       │
┌──────▼────────┐
│  Omniscient    │  →  Core AI Forensics & OSINT framework
└───────────────┘

Quick Start
1. Clone Repositories
git clone https://github.com/MrSiebel585/init.git
git clone https://github.com/MrSiebel585/global.git
git clone https://github.com/MrSiebel585/control.git
git clone https://github.com/MrSiebel585/omniscient.git

2. Initialize Environment
cd init
bash setup.sh    # or python3 bootstrap.py

3. Install Global Utilities
cd ../global
pip install -r requirements.txt

4. Run Control CLI
cd ../control
python3 control.py --help

5. Launch Omniscient Core
cd ../omniscient
python3 omniscient_main.py

Features by Repo
🔹 Init

System bootstrap (packages, virtualenv, configs).

Docker/container initialization.

Security hardening setup.

🔹 Global

Shared scripts (bash, Python).

AI utilities (Hugging Face, LangChain, Ollama).

Logging & monitoring helpers.

🔹 Control

Unified CLI (control.py).

Service management (start/stop/restart).

RBAC & user management.

Modular command extension.

🔹 Omniscient

Digital Forensics Assistant (AI-driven).

OSINT pipelines (async queries, GHDB, scraping).

Log/file analysis (syslog, SQL, disk images).

Planned dashboards (Streamlit, Taipy).

Roadmap

✅ Repo scaffolding & separation of concerns.

🔄 In progress: AI log summarization, modular CLI (omniscientctl).

🔄 In progress: RBAC & security-hardened orchestration.

🖥 Planned: Streamlit/Taipy dashboards for forensics/OSINT.

☁️ Planned: SaaS-ready enterprise deployment.

Contributing

Fork the repo you want to contribute to.

Create a feature branch:

git checkout -b feature/my-feature


Commit & push changes.

Open a Pull Request.

License

All repos are under MIT License
, with optional commercial extensions planned.

⚡ Next step: you could add a /docs/ folder in the root of each repo, but also a top-level /docs/master/ folder that links them together like above.

👉 Do you want me to actually generate the /docs/ tree structure (with installation.md, usage.md, roadmap.md, etc.) so you can drop it into each repo right away?

Connectors
Sources