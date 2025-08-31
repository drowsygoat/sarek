# SAREK Workflow Overview

This repository provides scripts, sample tables, and configuration JSONs to run the **SAREK pipeline** for variant calling.  
Below is a high-level overview of the workflow.

---

## Step 1. Initial Variant Calling

Run SAREK with **Strelka**, **DeepVariant**, and **FreeBayes**:

- Invoking script:  
  `sarek_invoking_scripts/AIL_sarek.sh`

- Config file:  
  `sarek/sarek_configs/ail_params_no_GATK.json`

This step generates variant calls from three independent callers.

---

## Step 2. Generate Consensus "Known Variants"

Create a **consensus set of high-confidence variants** by intersecting calls from all three variant callers.

- Scripts:  
  - `sarek/get_known_sites/module_make_known_sites_VCF.sh`  
  - `sarek/get_known_sites/module_isec_merge_known_sites_VCF.sh`

This produces the **known_sites VCF** used for downstream base quality recalibration and haplotype calling.

---

## Step 3. Haplotype Calling with GATK

Run SAREK with **GATK HaplotypeCaller**, using the consensus `known_sites` VCF generated in Step 2.

- Invoking script:  
  `sarek_invoking_scripts/AIL_haplotypcaller.sh`

- Config file:  
  `sarek/sarek_configs/ail_params_with_haplotypecaller.json`

This step improves variant calling accuracy by leveraging the known sites.

---

## Notes on Parental Analysis

- Parental samples were analyzed **without base recalibration** (by design).  
- Scripts for extracting parental reads are located in:  
  `sarek/bb_scripts`  
- ⚠️ These scripts currently require updates and will **not run as-is**.

---

## Workflow Summary

1. **Run SAREK** with Strelka, DeepVariant, FreeBayes → produce initial variant calls.  
2. **Intersect variants** → generate consensus `known_sites` VCF.  
3. **Run SAREK with GATK HaplotypeCaller** using consensus known_sites.  
4. (Optional) Parental analysis without base recalibration; update `bb_scripts` as needed.

---

## Documentation

- Each script and configuration JSON has specific usage instructions.  
- This README provides only the **general workflow overview**.
