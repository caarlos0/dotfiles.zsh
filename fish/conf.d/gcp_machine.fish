function gcp_machine --description "given a GCP machine type, show its CPU and Memory"
	switch $argv[1]
	case n1-standard-1
		set cpu 1
		set memory 3
	case n1-standard-2
		set cpu 2
		set memory 7
	case n1-standard-4
		set cpu 4
		set memory 15
	case n1-standard-8
		set cpu 8
		set memory 30
	case n1-standard-16
		set cpu 16
		set memory 60
	case n1-standard-32
		set cpu 32
		set memory 120
	case n1-standard-64
		set cpu 64
		set memory 240
	case n1-standard-96
		set cpu 96
		set memory 360
	case n1-highmem-2
		set cpu 2
		set memory 13
	case n1-highmem-4
		set cpu 4
		set memory 26
	case n1-highmem-8
		set cpu 8
		set memory 52
	case n1-highmem-16
		set cpu 1
		set memory 104
	case n1-highmem-32
		set cpu 3
		set memory 208
	case n1-highmem-64
		set cpu 6
		set memory 416
	case n1-highmem-96
		set cpu 9
		set memory 624
	case n1-highcpu-2
		set cpu 2
		set memory 1.80
	case n1-highcpu-4
		set cpu 4
		set memory 3.60
	case n1-highcpu-8
		set cpu 8
		set memory 7.20
	case n1-highcpu-16
		set cpu 1
		set memory 14
	case n1-highcpu-32
		set cpu 3
		set memory 28
	case n1-highcpu-64
		set cpu 6
		set memory 57
	case n1-highcpu-96
		set cpu 9
		set memory 86
	case n2d-highcpu-2
		set cpu 2
		set memory 2
	case n2d-highcpu-4
		set cpu 4
		set memory 4
	case n2d-highcpu-8
		set cpu 8
		set memory 8
	case n2d-highcpu-16
		set cpu 1
		set memory 16
	case n2d-highcpu-32
		set cpu 3
		set memory 32
	case n2d-highcpu-48
		set cpu 4
		set memory 48
	case n2d-highcpu-64
		set cpu 6
		set memory 64
	case n2d-highcpu-80
		set cpu 8
		set memory 80
	case n2d-highcpu-96
		set cpu 9
		set memory 96
	case n2d-highcpu-128
		set cpu 1
		set memory 8
	case n2d-highcpu-224
		set cpu 2
		set memory 4
	case n2d-highmem-2
		set cpu 2
		set memory 16
	case n2d-highmem-4
		set cpu 4
		set memory 32
	case n2d-highmem-8
		set cpu 8
		set memory 64
	case n2d-highmem-16
		set cpu 1
		set memory 128
	case n2d-highmem-32
		set cpu 3
		set memory 256
	case n2d-highmem-48
		set cpu 4
		set memory 384
	case n2d-highmem-64
		set cpu 6
		set memory 512
	case n2d-highmem-80
		set cpu 8
		set memory 640
	case n2d-highmem-96
		set cpu 9
		set memory 768
	case n2d-standard-2
		set cpu 2
		set memory 8
	case n2d-standard-4
		set cpu 4
		set memory 16
	case n2d-standard-8
		set cpu 8
		set memory 32
	case n2d-standard-16
		set cpu 1
		set memory 64
	case n2d-standard-32
		set cpu 3
		set memory 128
	case n2d-standard-48
		set cpu 4
		set memory 192
	case n2d-standard-64
		set cpu 6
		set memory 256
	case n2d-standard-80
		set cpu 8
		set memory 320
	case n2d-standard-96
		set cpu 9
		set memory 384
	case n2d-standard-128
		set cpu 1
		set memory 8
	case n2d-standard-224
		set cpu 2
		set memory 4
	case n2-highcpu-2
		set cpu 2
		set memory 2
	case n2-highcpu-4
		set cpu 4
		set memory 4
	case n2-highcpu-8
		set cpu 8
		set memory 8
	case n2-highcpu-16
		set cpu 1
		set memory 16
	case n2-highcpu-32
		set cpu 3
		set memory 32
	case n2-highcpu-48
		set cpu 4
		set memory 48
	case n2-highcpu-64
		set cpu 6
		set memory 64
	case n2-highcpu-80
		set cpu 8
		set memory 80
	case n2-highmem-2
		set cpu 2
		set memory 16
	case n2-highmem-4
		set cpu 4
		set memory 32
	case n2-highmem-8
		set cpu 8
		set memory 64
	case n2-highmem-16
		set cpu 1
		set memory 128
	case n2-highmem-32
		set cpu 3
		set memory 256
	case n2-highmem-48
		set cpu 4
		set memory 384
	case n2-highmem-64
		set cpu 6
		set memory 512
	case n2-highmem-80
		set cpu 8
		set memory 640
	case n2-standard-2
		set cpu 2
		set memory 8
	case n2-standard-4
		set cpu 4
		set memory 16
	case n2-standard-8
		set cpu 8
		set memory 32
	case n2-standard-16
		set cpu 1
		set memory 64
	case n2-standard-32
		set cpu 3
		set memory 128
	case n2-standard-48
		set cpu 4
		set memory 192
	case n2-standard-64
		set cpu 6
		set memory 256
	case n2-standard-80
		set cpu 8
		set memory 320
	case e2-highcpu-2
		set cpu 2
		set memory 2
	case e2-highcpu-4
		set cpu 4
		set memory 4
	case e2-highcpu-8
		set cpu 8
		set memory 8
	case e2-highcpu-16
		set cpu 1
		set memory 16
	case e2-highmem-2
		set cpu 2
		set memory 16
	case e2-highmem-4
		set cpu 4
		set memory 32
	case e2-highmem-8
		set cpu 8
		set memory 64
	case e2-highmem-16
		set cpu 1
		set memory 128
	case e2-standard-2
		set cpu 2
		set memory 8
	case e2-standard-4
		set cpu 4
		set memory 16
	case e2-standard-8
		set cpu 8
		set memory 32
	case e2-standard-16
		set cpu 1
		set memory 64
	case '*'
		set cpu '?'
		set memory '?'
	end
	echo (set_color magenta)$argv[1](set_color normal): $cpu vCPUs and $memory GB of RAM
end
