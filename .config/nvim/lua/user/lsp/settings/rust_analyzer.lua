return {
     settings = {
        ["rust-analyzer"] = {
            assist = {
                importGranularity = "module",
                importPrefix = "self",
            },
            cargo = {
		allFeatures = true,
                loadOutDirsFromCheck = true,
            },
            procMacro = {
                enable = true
            },
        }
    }
}
