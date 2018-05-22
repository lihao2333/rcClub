alias psql_start="pg_ctl -D /home/pi/pgdata -l /home/pi/pgdata/logfile start"
alias psql_login_ser="psql -U pi -d raspberry -h 23.105.194.46 -p 5432"
alias psql_restart="pg_ctl -D /home/pi/pgdata -l /home/pi/pgdata/logfile restart"
