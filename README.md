Implementation of the divergence-driven zeroth-order optimization.

You can reproduce the results in the paper by running.
```bash
# MODEL=facebook/opt-2.7b TASK=SST2 MODE=ft LR=1e-6 EPS=1e-3 SEED=42 STEPS=4000 ENHANCED=zo bash mezo.sh
```
the setting of $ENHANCED$ can be $zo$ or $fo$ or just do not set it.
