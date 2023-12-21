-- Create the database
CREATE DATABASE emedgene_v6_demo;
USE emedgene_v6_demo;

-- Create a user role (if needed)
CREATE USER 'root'@'%' IDENTIFIED BY 'root';

-- Grant privileges to the user
GRANT ALL PRIVILEGES ON emedgene_v6_demo.* TO 'root'@'%';

-- MySQL script with a TEXT type for the JSON-like content.
CREATE TABLE organization (
    id INT PRIMARY KEY,
    organization_name VARCHAR(255) NOT NULL,
    settings TEXT NOT NULL
) ENGINE=InnoDB;

-- Insert the mock data
-- Note: The mock data provided will be inserted here in the same format, with the JSON as a text string.
INSERT INTO organization (id, organization_name, settings) VALUES
(1, "Goldstein" ,'{"LocalDBs": [{"path": "/opt/data/post/bch_poduri.vcf.gz", "prefix": "Blacklist", "filename": "genedx_blacklist_04162019.txt", "reference": "hg19", "extra_fields": [], "analysisField": "AF", "use_in_zapp_filters": true}], "is_automated": true, "bender_version": "33.0", "presetsAllowed": true, "presetsHardcoded": false, "storage_configurations": {"storage": "aws", "storage_proxy_domain": ""}}'),
(2, "Boone" ,'{"LocalDBs": [{"path": "/opt/data/post/bch_poduri.vcf.gz", "prefix": "Blacklist", "filename": "genedx_blacklist_04162019.txt", "reference": "hg19", "extra_fields": [], "analysisField": "AF", "use_in_zapp_filters": true}], "is_automated": true, "bender_version": "33.0", "presetsAllowed": true, "presetsHardcoded": false, "storage_configurations": {"storage": "aws", "storage_proxy_domain": ""}}'),
(3, "Miriam" ,'{"presetsAllowed": true, "is_automated": true, "flexo_version": "33.0", "dragen_version": "4.2", "flexo_reference": "hg38", "bender_version": "33.0", "region_based_coverage": true, "presetsHardcoded": false, "prefer_org_transcript": true, "sanity_gene_threshold": 50, "preload_case": true, "custom_varcallers": {"smn_varcaller": true, "sv_varcaller": true, "str_varcaller": true}, "hasKnownVariantsDB": true, "storage_configurations": {"storage": "aws", "storage_proxy_domain": ""}, "carrier_analyses": {"known_database": true, "severity_based": false}, "default_case_extra_data": {"labNumber": "", "specimen": "", "receivedDate": "", "collectedDate": ""}}'),
(4, "Jambalaia" ,'{"LocalDBs": [{"path": "/opt/data/elzar/localdb/Shriners_EvalStaging/noise/hg38-wgs-cnv/2023-07-11T14:15:27.076669Z/db.vcf.gz", "is_cnv": true, "prefix": "new-Shriners-hg38-noise-wgs-cnv", "update": {"mtime": "2023-07-11T14:15:27.076669Z", "db_type": "noise", "test_type": "wgs"}, "filename": "2023-07-11-noisedb", "reference": "hg38", "extra_fields": [], "analysisField": "AF", "use_in_zapp_filters": true}, {"prefix": "Shriners-hg38-noise-wgs-snv", "path": "/opt/data/elzar/localdb/Shriners_EvalStaging/noise/hg38-wgs-snv/2023-06-20T18:53:55.722719Z/db.vcf.gz", "filename": "2023-06-20-noisedb", "reference": "hg38", "extra_fields": [], "analysisField": "AF", "use_in_zapp_filters": true, "is_cnv": false, "update": {"db_type": "noise", "test_type": "wgs", "mtime": "2023-06-20T18:53:55.722719+00:00"}}], "CNV_AA": true, "analysisFiltersActiveTab": "presets", "defaultTestPageTab": "analysisTools", "bender_version": "33.0", "dragen_version": "4.0", "flexo_version": "33.0", "flexo_reference": "hg38", "custom_varcallers": {"sv_varcaller": true, "str_varcaller": true}, "is_automated": true, "presetsAllowed": true, "region_based_coverage": true, "storage_configurations": {"storage": "aws", "storage_proxy_domain": ""}}'),
(5, "GreenSushi" ,'{"LocalDBs": [{"path": "/opt/data/post/noise_dragen32.vcf.gz", "prefix": "NoiseDB", "filename": "Noise DB Dragen 3.2", "extra_fields": [], "analysisField": "AF", "reference": "hg19"}, {"analysisField": "AF", "extra_fields": ["TEN", "Het"], "filename": "Greenwood_Pilot_localdb.vcf.gz", "path": "/opt/data/post/noise_db/Greenwood_Pilot/Greenwood_Pilot_localdb.vcf.gz", "prefix": "GGC Historic", "reference": "hg19"}], "is_automated": true, "preload_case": true, "presetsAllowed": true, "bender_version": "5.29", "flexo_version": "3.4", "dragen_version": "3.9", "custom_varcallers": {"sv_varcaller": true, "str_varcaller": true, "cyp2d6_varcaller": false}, "KnownVariantsDBs": [{"id": "GGC_Curated", "path": "/opt/data/post/GGC_Curated.vcf.gz", "filename": "GGC_Curated.vcf.gz", "key_field": "significance", "extra_fields": ["category"], "reference": "hg19"}], "hasKnownVariantsDB": true, "region_based_coverage": true, "storage_configurations": {"storage": "lol2", "storage_proxy_domain": ""}, "lol2": {"BUCKET_NAME": "ggc-emedgene-results"}, "retention_days": 90}'),
(6, "OddNicholas" ,'{"presetsAllowed": true, "storage_configurations": {"storage": "ica2", "storage_proxy_domain": ""}, "flexo_version": "33.0", "bender_version": "33.0", "dragen_version": "4.2", "flexo_reference": "hg19", "is_automated": true}')
;