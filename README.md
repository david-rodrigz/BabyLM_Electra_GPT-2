# BabyLM Challenge - pertaining Electra and GPT2

This repository logs the pre-training processes and evaluations for the Electra and GPT-2 models as part of the BabyLM Challenge. 

The BabyLM Challenge is a competition focused on training efficient language models with limited data, similar to the amount of text a child encounters (around 100 million words). In this project, we focus on pre-training Electra and GPT2 with BabyLM's 10 million word dataset to evaluate and compare pre-training and fine-tuning performance with BLiMP and GLUE benchmarks, respectively. 

# How to run

For each the `training_electra.ipynb` and the `training_gpt2.ipynb` notebooks: 

1. Install the following libraries:
    * `accelerate`
    * `transformers[torch]`
2. Step through the notebook and wait for pre-training processes to complete.

For BLiMP and GLUE evaluations, step through the `evaluations.ipynb` notebook. All results for each sub evaluation can be found in the `electra_dir` and the `gpt2_dir`. The BLiMP results are located in the `finetune/` folder while the GLUE results are located in the `zeroshot/` folder. Ue the `get_results.sh` script to summarize the results for each evaluation as so:

```bash
get_results.sh electra_dir/finetune
get_results.sh electra_dir/zeroshot
get_results.sh GPT2_dir/finetune
get_results.sh GPT2_dir/zeroshot
```

# Results

The following are the result metrics for Electra and GPT2 as well as some baseline metrics from models included in [BabyLM's evaluation pipeline](https://github.com/babylm/evaluation-pipeline-2023).

# Results

*BLiMP* (Acc.)
| Model | Anaphor Agr. | Agr. Structure | Binding | Control/Raising | D-N Agr. | Ellipsis | Filler-Gap | Irregular Forms | Island Effects | NPI Licensing | Quantifiers | S-V Agr. |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Electra | 58.8 | 58.8 | 40.7 | 58.6 | 49.7 | 39.2 | 28.9 | 38.3 | 52.9 | 25.4 | 54.9 | 51.0 |
| GPT-2 | 98.8 | 78.1 | 79.2 | 78 | 94.1 | 88.2 | 79.3 | 93.4 | 73.1 | 71.6 | 84.2 | 88.7 |
| OPT-125m | 63.8 | 70.6 | 67.1 | 66.5 | 78.5 | 62 | 63.8 | 67.5 | 48.6 | 46.7 | 59.6 | 56.9 |
| RoBERTa-base | 81.5 | 67.1 | 67.3 | 67.9 | 90.8 | 76.4 | 63.5 | 87.4 | 39.9 | 55.9 | 70.5 | 65.4 |
| T5-base | 68.9 | 63.8 | 60.4 | 60.9 | 72.2 | 34.4 | 48.2 | 77.6 | 45.6 | 47.8 | 61.2 | 65.0 |

*(Super)GLUE* (Default: Acc.)
| Model | CoLA (MCC) | SST-2 | MRPC (F1) | QQP (F1) | MNLI | MNLI-mm | QNLI | RTE | BoolQ | MultiRC | WSC |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Electra | 69.5 | 75 | 69.5 | 58 | 37.7 | 37.7 | 49.6 | 53.5 | 59.9 | 55.1 | 55.4 |
| GPT-2 | 77.5 | 89.4 | 72.3 | 82.4 | 75.4 | 76.8 | 85.3 | 59.6 | 65.8 | 61.3 | 59.0 |
| OPT-125m | 15.2 | 81.9 | 72.5 | 60.4 | 57.6 | 60.0 | 61.5 | 60.0 | 63.3 | 55.2 | 60.2 |
| RoBERTa-base | 25.8 | 87.0 | 79.2 | 73.7 | 73.2 | 74.0 | 77.0 | 61.6 | 66.3 | 61.4 | 61.4 |
| T5-base | 11.3 | 78.1 | 80.5 | 66.2 | 48.0 | 50.3 | 62.0 | 49.4 | 66.0 | 47.1 | 61.4 |
