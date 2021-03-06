cd /scratch/alauring_fluxm/avalesan/Matlab_OPV2
mkdir plate3_Run_2909
cd plate3_Run_2909
mkdir data
mkdir data/fastq
mkdir data/reference
# copy over reference files
cp /nfs/turbo/med-alauring2/raw_data/2019/Run_2909/lauring/*/* data/fastq/
python ../change_miseq_names_Matlab.py -s data/fastq -f data/fastq_renamed -run
cd data/fastq_renamed
gunzip -v *gz
mv 131844.1.1.fastq Sabin2_PlasmidControl.1.1.fastq
mv 131844.2.1.fastq Sabin2_PlasmidControl.2.1.fastq
cd ../../
qsub submit_pipeline.pbs
