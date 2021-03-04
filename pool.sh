#!/bin/bash

# The pool of workers size:
WORKERS=10

# Check the pool status
status(){
  alive=0
  for p in pid.*
  do
    [ "$p" = 'pid.*' ] && break
    pid="${p:4}"
    wk=`ps -fp "$pid" 2>/dev/null | sed -n 's/.* worker //p'`
    if [ ! -z "$wk" ]
    then
      let "alive++"
      [ $1 = 0 ] && printf 'Worker %s is running, PID %s\n' "$wk" "$pid"
    else
      rm -f "$p"
    fi
  done
  if [ $1 = 0 ]
  then
    [ $alive = 0 ] && printf 'NOK\n' || printf 'OK: %s/%s\n' $alive "$WORKERS"
  fi
  return $alive
}

# Stop the pool
stop(){
  for p in pid.*
  do
    [ "$p" = 'pid.*' ] && break
    pid="${p:4}"
    wk=`ps -fp "$pid" 2>/dev/null | sed -n 's/.* worker //p'`
    if [ ! -z "$wk" ]
    then
      kill "$pid" 2>/dev/null
      sleep 0
      kill -0 "$pid" 2>/dev/null && sleep 1 && kill -9 "$pid" 2>/dev/null
    fi
    rm -f "$p"
  done
}

# Start the pool
run(){
  status 1
  [ $? != 0 ] && printf 'Already running\n' && exit 0

  # Setup the queue
  rm -f myqueue mylock
  mkfifo myqueue

  # Launch N workers in parallel
  for i in `seq $WORKERS`
  do
    /bin/bash worker $i &
    touch pid.$!
  done
}

case $1 in
  "start")
    run
    ;;
  "stop")
    stop
    ;;
  "status")
    status 0
    ;;
  *)
    printf 'Unsupported command\n'
    ;;
esac