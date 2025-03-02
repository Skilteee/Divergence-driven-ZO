Implementation of the divergence-driven zeroth-order optimization.

You can reproduce the results in the paper by running. There are still some bugs when applying First-order for \gamma searching, which may cause the memory to keep increasing during training.
```bash
# do not involve \gamma
MODEL=facebook/opt-2.7b TASK=SST2 MODE=ft LR=1e-6 EPS=1e-3 STEPS=4000 bash mezo.sh
# use zo for \gamma searching
MODEL=facebook/opt-2.7b TASK=SST2 MODE=ft LR=1e-6 EPS=1e-3 STEPS=4000 ENHANCED=zo bash mezo.sh
# use fo for \gamma searching
MODEL=facebook/opt-2.7b TASK=SST2 MODE=ft LR=1e-6 EPS=1e-3 STEPS=4000 ENHANCED=fo bash mezo.sh
```

You can search for the keyword `DiZO` to find the parts related to divergence-driven (mainly in `trainer.py`).

Some tips for training:
* `ZO` is sensitive to hyperparameter settings (including seeds).
* For `DiZO`, in easier datasets (e.g. SST-2), you can apply more aggressive projection, i.e., larger projection scalar or more frequent projection learning, and vice versa.
* Among all the hyperparameters in `DiZO`: clip range, projection updating cycle, and step size in projection learning have a larger influence on the performance.

