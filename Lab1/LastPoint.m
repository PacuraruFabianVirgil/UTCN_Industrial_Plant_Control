Htp = tf([2],[1 2 4])
Hpi = 2*tf([0.6 1],[0.6 0])
Hseries = series(Hpi, Htp)
step(feedback(Hseries,1))