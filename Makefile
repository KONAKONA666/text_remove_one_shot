NAME=remove_text
DATASET_PATH=C:\Users\Aybek\logo_gen\dataset
GPUS=1

.PHONY: build train_model create_dataset

build:
	docker build -f .\Dockerfile -t $(NAME):train  . 

create_dataset:
	docker run -ti -v ($DATASET_PATH):/home/konakona/dataset ($NAME):train cd scripts/ && python3.9 create_EnsNet_dataset.py -v 1 && python3.9 create_EnsNet_dataset.py

train_model:
	mkdir training
	docker run -ti -v ./training/:/home/konakona/src/training/ ($NAME):train python3.9 train.py --config config/config_SCUT.yml




