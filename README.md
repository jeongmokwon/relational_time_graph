# RTG — Relational-Time GNN

> **“Time is not a timestamp, but the change itself.”**  
> Official implementation of **RTG** from  
> **_Relational-Time Graph Neural Networks for Session-Based Prediction_** (arXiv 2025).
---

## 1  Main ideas
* **Δ̂ edge attribute** – learnable scalar for *semantic* change between actions.  
* **World-Sync edges** – link users who touched the same item in the same 30-min bucket.

Full details → [paper](▸ arXiv URL).

---

## 2  Quick start
### 2.1 Install
```bash
git clone https://github.com/jeongmokwon/relational_time_graph.git
cd relational_time_graph
pip install -r requirements.txt            # base deps

# CPU wheels
pip install torch-scatter torch-sparse -f \
https://data.pyg.org/whl/torch-2.1.0+cpu.html

# CUDA 11.8 wheels (optional)
# pip install torch-scatter torch-sparse -f \
# https://data.pyg.org/whl/torch-2.1.0+cu118.html
```

### 2.2 Dataset
We use the **RetailRocket Ecommerce “events.csv”** file (Kaggle).

```bash
./scripts/get_data.sh          # downloads to data/events.csv
```
Source (CC BY 4.0): https://www.kaggle.com/datasets/retailrocket/ecommerce-dataset


### 2.3 Run
```bash
python rtg_ws_train.py --device cpu  --ws_keep 0.5   # CPU
python rtg_ws_train.py --device cuda --ws_keep 0.5   # GPU
```

## 3 Command-line options

| flag          | default      | description                             |
| ------------- | ------------ | --------------------------------------- |
| `--device`    | `cpu`        | `cuda` or `cpu`                         |
| `--ws_keep`   | `1.0`        | fraction of World-Sync edges kept (0–1) |
| `--data_path` | `events.csv` | custom events file path                 |

## 4 Reproducing Table 5
python rtg_ws_train.py --device cuda --ws_keep 1.0 --seeds 15 42 100
#### expected: F1 ≈ 0.412 ± 0.002

## 5 Citation
```bibtex
@misc{kwon025rtg,
  title   = {Relational-Time Graph Neural Networks},
  author  = {Jeongmo Kwon},
  year    = {2025},
  eprint  = {2507.12345},
  archivePrefix = {arXiv},
  primaryClass = {cs.LG}
}
```

## 6 License
MIT – see LICENSE.

<p align="center">Feel free to open an issue or PR !</p>
