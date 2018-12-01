/* https://carbon.now.sh/?bg=rgba(255%2C255%2C255%2C1)&t=cobalt&wt=none&l=elm&ds=true&dsyoff=20px&dsblur=68px&wc=true&wa=false&pv=55px&ph=50px&ln=false&fm=Fira%20Code&fs=15px&lh=133%25&si=false&code=let%2520date%2520%253D%2520Js.Date.make()%253B%250A%250AReDate.(%250A%2520%2520date%250A%2520%2520-%253EaddMonths(1)%250A%2520%2520-%253ElastDayOfMonth%250A%2520%2520-%253EisWeekend%250A)%253B&es=2x&wm=false */

let date = Js.Date.make();

ReDate.(
  date
  ->addMonths(1)
  ->lastDayOfMonth
  ->isWeekend
);
