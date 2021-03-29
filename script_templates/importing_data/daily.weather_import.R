
# this code will import the daily weather from the Amherst, MA weather station
# this file includes data from 2018-2019
# See this webpage for more information and to cite the data source:
# Global Historical Climatology Network (GHCN):
# https://www.ncdc.noaa.gov/data-access/land-based-station-data/land-based-datasets/global-historical-climatology-network-ghcn


daily.weather <- read_csv("data/mill/daily.weather.csv",
                 col_types = cols(date = col_date(format = "%Y-%m-%d")
                          )) 
