# displays information about the current time sources that chronyd is accessing
chronyc sources

# MS Name/IP address         Stratum Poll Reach LastRx Last sample
# ===============================================================================
# #* GPS0                          0   4   377    11   -479ns[ -621ns] +/-  134ns
# ^? ntp1.example.net              2   6   377    23   -923us[ -924us] +/-   43ms
# ^+ ntp2.example.net              1   6   377    21  -2629us[-2619us] +/-   86ms
# S
#    This column indicates the selection state of the source.
# 
#     * indicates the best source which is currently selected for synchronisation.
# 
#     + indicates other sources selected for synchronisation, which are combined with the
#     best source.
# 
#     - indicates a source which is considered to be selectable for synchronisation, but
#     not currently selected.
# 
#     x indicates a source which chronyd thinks is a falseticker (i.e. its time is
#     inconsistent with a majority of other sources, or sources specified with the trust
#     option).
# 
#     ~ indicates a source whose time appears to have too much variability.
# 
#     ? indicates a source which is not considered to be selectable for synchronisation
#     for other reasons (e.g. unreachable, not synchronised, or does not have enough
#     measurements).

