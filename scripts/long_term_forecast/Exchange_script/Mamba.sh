model_name=Mamba
for pred_len in 21 30 48 60 72 96; do

	python -u run.py \
		--task_name long_term_forecast \
		--is_training 1 \
		--root_path ./dataset/exchange_rate/ \
		--data_path exchange_rate.csv \
		--model_id Exchange_$pred_len \
		--model $model_name \
		--data custom \
		--features M \
		--seq_len 96 \
		--label_len 48 \
		--pred_len $pred_len \
		--e_layers 2 \
		--d_layers 1 \
		--enc_in 5 \
		--expand 2 \
		--d_ff 16 \
		--d_conv 4 \
		--c_out 1 \
		--d_model 64 \
		--des 'Exp' \
		--itr 1

done
