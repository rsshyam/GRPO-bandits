#!/bin/bash

set -e
set -x

ACTION_NUM=16
GROUP_NUM=2
PREF_DATA_NUM=40
PG_NUM_ITERS=1000
REG_COEF=0.01
STATE_DIM=1
RDPO_NUM_ITERS=1000
STEP_SIZE=0.05
EXP_STEP_SIZE=0.01
BATCH_SIZE=5

# Create log directory with timestamp
LOG_DIR="log-weighted-dpo_sep/rdpo/$(date +'%Y_%m_%d_%H_%M_%S')_$RDPO_NUM_ITERS"
mkdir -p "$LOG_DIR"

# Generate weights from [0.1, 0.9] to [0.9, 0.1]
for weight in $(seq 0.1 0.1 0.9)
do
    WEIGHTS=[$weight,$(awk "BEGIN {print 1 - $weight}")]
    
    for seed in 2021 2022 2023 2024 2025 2026 2027 2028 2029 2030 2031 2032 2033 2034 2035 2036 2037 2038 2039 2040
    do
        python -m experiments.run_group_linear_bandit_sep_theta_rdpo \
        --mle_adaptive \
        --state_dim ${STATE_DIM} \
        --action_num ${ACTION_NUM} \
        --group_num ${GROUP_NUM} \
        --pref_data_num ${PREF_DATA_NUM} \
        --rl_data_ratio 0.5 \
        --pg_num_iters ${PG_NUM_ITERS} \
        --rdpo_num_iters ${RDPO_NUM_ITERS} \
        --reg_coef ${REG_COEF} \
        --pg_adaptive \
        --seed ${seed} \
        --weights ${WEIGHTS} \
        --logdir ${LOG_DIR} \
        --rdpo_step_size ${STEP_SIZE} \
        --rdpo_exp_step_size ${EXP_STEP_SIZE}\
        --rdpo_batch_size ${BATCH_SIZE}\

    done
done
#sh scripts/run_group_linear_bandit_wo_plot_sep_theta_rdpo.sh
#2022 2023 2024 2025 2026 2027 2028 2029 2030
#2023 2024 2025 2026 2027 2028 2029 2030
#2023 2024 2025 2026 2027 2028 2029 2030
#2022 2023 2024 2025 2026 2027 2028 2029 2030 2031 2032 2033 2034 2035 2036 2037 2038 2039 2040