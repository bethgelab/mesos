remove-all:
	docker rm -f mesos_slave_1
	docker rm -f mesos_master_1
	docker rm -f mesos_zookeeper_1

start-mesos:
	docker run -it mesosphere/mesos:1.0.1-2.0.93.ubuntu1404

nvidia-smi:
	docker run -it --rm mesosphere/mesos:1.0.1-2.0.93.ubuntu1404 mesos-execute --master=192.168.99.54:5050 --command='echo ldpath $(LD_LIBRARY_PATH)' --name=gpu-test --docker_image=nvidia/cuda --framework_capabilities="GPU_RESOURCES" --resources="gpus:1"  --volumes='[{ "container_path": "/usr/local/nvidia/", "host_path": "/usr/local/nvidia/", "mode": "RW"}]'

start-4:
	nvidia-docker-compose -f docker-compose-gpu4.yml up

start-5:
	nvidia-docker-compose -f docker-compose-gpu5.yml up
