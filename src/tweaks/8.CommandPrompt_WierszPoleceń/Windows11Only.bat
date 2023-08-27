@echo off
netsh int tcp set supplemental Internet CongestionProvider=BBR2
netsh int tcp set supplemental Custom CongestionProvider=BBR2
netsh int tcp set supplemental InternetCustom CongestionProvider=BBR2
netsh int tcp set supplemental Datacenter CongestionProvider=BBR2
netsh int tcp set supplemental Compat CongestionProvider=BBR2
netsh int tcp set supplemental Template=Internet CongestionProvider=BBR2
netsh int tcp set supplemental Template=Datacenter CongestionProvider=BBR2
netsh int tcp set supplemental Template=Compat CongestionProvider=BBR2
netsh int tcp set supplemental Template=DatacenterCustom CongestionProvider=BBR2
netsh int tcp set supplemental Template=InternetCustom CongestionProvider=BBR2