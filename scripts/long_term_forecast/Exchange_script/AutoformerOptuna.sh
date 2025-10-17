#!/bin/sh
export CUDA_VISIBLE_DEVICES=0
model_name=Autoformer

for pred_len in 1 7 14 30; do
	python -u optuna_tune.py \
		--task_name long_term_forecasting \
		--is_training 1 \
		--root_path ./dataset/exchange_rate/ \
		--data_path exchange_rate.csv \
		--model_id Exchange_$pred_len \
		--model $model_name \
		--data custom \
		--study_name Autoformer_Exchange_$pred_len \
		--n_trials 50 \
		--features M \
		--seq_len 96 \
		--label_len 48 \
		--pred_len $pred_len \
		--e_layer 2 \
		--d_layer 1 \
		--factor 3 \
		--d_ff 16 \
		--d_model 128 \
		--enc_in 5 \
		--dec_in 5 \
		--c_out 5 \
		--des 'Exp' \
		--itr 1 
		
done
