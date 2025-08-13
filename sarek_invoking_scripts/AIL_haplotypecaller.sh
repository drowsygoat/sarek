#!/bin/bash

# Initialize conda for the current shell session
# __conda_setup="$('conda' 'shell.bash' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
#         . "$HOME/miniconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="$HOME/miniconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup

# conda activate nextflow-env

source sml.sh PDC/23.12
# source sml.sh bioinfo-tools
source sml.sh singularity
# source sml.sh samtools/1.20
source sml.sh nextflow

export NXF_HOME="/cfs/klemming/projects/snic/sllstore2017078/lech/nobackup/nextflow"

export NXF_SINGULARITY_CACHEDIR="/cfs/klemming/projects/snic/sllstore2017078/lech/nobackup/singularity-images"

export NXF_TEMP="/cfs/klemming/projects/snic/sllstore2017078/lech/nobackup/nfx_temp"

export NXF_LAUNCHER="/cfs/klemming/projects/snic/sllstore2017078/lech/nobackup/nfx_launcher"

nextflow run /cfs/klemming/projects/snic/sllstore2017078/lech/clones/sarek \
    -profile pdc_kth \
    -name $1 \
    -params-file $2 \
    -resume \
    --project=${COMPUTE_ACCOUNT} \
    --email=${USER_E_MAIL} \
    --step prepare_recalibration \
    --known_indels /cfs/klemming/projects/snic/sllstore2017078/lech/sarek/run1_no_GATK/merge_known_sites_vcf/merged_intersected.vcf.gz