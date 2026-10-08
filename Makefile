setup:
	mkdir -p malicious_dir
antivirus: setup
	./antivirusd.sh dir malicious_dir 2
restore: setup
	./restore.sh dir malicious_dir
