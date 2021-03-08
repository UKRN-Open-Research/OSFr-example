#### List files in OSF component

osf_component <- "26j4q"  # id part of the component URL
Sys.setenv(OSF_SERVER = "test")  # set to testing environment

component <- osfr::osf_retrieve_node(osf_component)
files <- osfr::osf_ls_files(component)
for (r in 1:nrow(files))
  osfr::osf_download(files[r,], path = 'raw_data', conflicts = "overwrite")

## files are now located in raw_data directory
## they can be loaded with read_csv('raw_data/filename.csv')

print(paste0(
  "Downloaded ", nrow(files), " files from OSF component '", osf_component, "'."
))