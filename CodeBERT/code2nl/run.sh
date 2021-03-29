#! bash
lang=php #programming langage
lr=5e-5
beam_size=10
batch_size=16
source_length=256
target_length=128
data_dir=../../data/code2nl/CodeSearchNet
output_dir=model/${lang}
train_file=${data_dir}/${lang}/train.jsonl
dev_file=${data_dir}/${lang}/valid.jsonl
eval_step=1000
train_step=50000
pretrained_model=microsoft/codebert-base
python run.py --do_train --do_eval --model_type roberta --model_name_or_path ${pretrained_model} --train_filename ${train_file} --dev_filename ${dev_file} --output_dir ${output_dir} --max_source_length ${source_length} --max_target_length ${target_length} --beam_size ${beam_size} --train_batch_size ${batch_size} --eval_batch_size ${batch_size} --learning_rate ${lr} --train_step ${train_step} --eval_step ${eval_step}