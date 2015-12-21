all: gene2accession.min.tsv

clean:
	rm gene2accession.min.tsv gene2accession.tsv

gene2accession.tsv:
	wget ftp://ftp.ncbi.nlm.nih.gov/gene/DATA/gene2accession.gz
	gunzip gene2accession.gz
	mv gene2accession gene2accession.tsv

gene2accession.min.tsv: gene2accession.tsv
	cat gene2accession.tsv | awk '{print $7"\t"$8"\t"$9}' > gene2accession.min.tsv
