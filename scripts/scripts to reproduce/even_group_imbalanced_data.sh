sh scripts/run_glp_mult_uneven.sh --dpo_type 'rdpo' --feature_type 'swapped' --step_size 0.5 --reg_coef 1 --exp_step_size 0.9 --eval_metric 'argmax' --ipo_grad_type 'justdpo' --param_limit 5 --dpo_num_iters 10000 --use_closed_form False --deterministic_ratio_list '[1,1]' --weighted_batches False --lamba 0 --val_deterministic_ratio_list '[1,1]' --use_theory False --use_uneven_grp False --use_uneven_grp_val False --weight 0.2 --wandb_group 'RDPO_chi' --chi 1
