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
source sml.sh bioinfo-tools
source sml.sh singularity
source sml.sh samtools/1.20

export NXF_HOME="/cfs/klemming/projects/snic/sllstore2017078/lech/nobackup/nextflow"

export NXF_SINGULARITY_CACHEDIR="/cfs/klemming/projects/snic/sllstore2017078/lech/nobackup/singularity-images"

export NXF_TEMP="/cfs/klemming/projects/snic/sllstore2017078/lech/nobackup/nfx_temp"

export NXF_LAUNCHER="/cfs/klemming/projects/snic/sllstore2017078/lech/nobackup/nfx_launcher"

nextflow run nf-core/sarek \
    -profile pdc_kth \
    -r 3.4.3 \
    -name $1 \
    -params-file $2 \
    --project=${COMPUTE_ACCOUNT} \
    --email=${USER_E_MAIL}



# WARN: If GATK's Haplotypecaller, Sentieon's Dnascope or Sentieon's Haplotyper is specified, without `--dbsnp` or `--known_indels no filtering will be done. For filtering
# , please provide at least one of `--dbsnp` or `--known_indels`.                     
# For more information see FilterVariantTranches (single-sample, default): https://gatk.broadinstitute.org/hc/en-us/articles/5358928898971-FilterVariantTranches
# For more information see VariantRecalibration (--joint_germline): https://gatk.broadinstitute.org/hc/en-us/articles/5358906115227-VariantRecalibrator
# For more information on GATK Best practice germline variant calling: https://gatk.broadinstitute.org/hc/en-us/articles/qsq360035535932-Germline-short-variant-discovery-SNPs
# -Indels-                                  
# WARN: If GATK's Haplotypecaller, Sentieon's Dnascope and/or Sentieon's Haplotyper is specified, but without `--dbsnp`, `--known_snps`, `--known_indels` or the associated
#  resource labels (ie `known_snps_vqsr`), no variant recalibration will be done. For recalibration you must provide all of these resources.
# For more information see VariantRecalibration: https://gatk.broadinstitute.org/hc/en-us/articles/5358906115227-VariantRecalibrator                                       
# Joint germline variant calling also requires intervals in order to genotype the samples. As a result, if `--no_intervals` is set to `true` the joint germline variant cal
# ling will not be performed.               


# ERROR ~ Cannot get property 'baseName' on null object                                                                                                                    

#  -- Check script '/cfs/klemming/projects/snic/sllstore2017078/lech/nobackup/nextflow/assets/nf-core/sarek/./workflows/sarek/../../subworkflows/local/bam_variant_calling_
# germline_all/main.nf' at line: 133 or see '.nextflow.log' file for more details     
# ERROR ~ Cannot get property 'baseName' on null object                                                                                                                    

#  -- Check script '/cfs/klemming/projects/snic/sllstore2017078/lech/nobackup/nextflow/assets/nf-core/sarek/./workflows/sarek/../../subworkflows/local/bam_variant_calling_
# germline_all/main.nf' at line: 134 or see '.nextflow.log' file for more details     
# ERROR ~ Pipeline failed. Please refer to troubleshooting docs: https://nf-co.re/docs/usage/troubleshooting                                                               

#  -- Check '.nextflow.log' file for details     
