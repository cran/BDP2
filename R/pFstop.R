pFstop=function(p,vn.int,v.crit){

#### Stopping probability at every interim - here stopping for futility
#### Evaluate at vn.int[i] and stop if #successes <= v.crit[i]

  n.interim=length(vn.int)
  if (n.interim>10) stop("max 10 interims including final")
  probstop <- rep(0,n.interim)


  probstop[1] <- pbinom(size=vn.int[1],q=v.crit[1] ,p, lower.tail=TRUE)

  if (n.interim>1)
    for (my.i1 in (v.crit[1] + 1):vn.int[1]) {
      for (my.i2 in 0:(v.crit[2] - my.i1)) {
        probstop[2] <- probstop[2] +
          dbinom(size=vn.int[1],x=my.i1,p)*
          (v.crit[2] -my.i1 >= 0)*dbinom(size=vn.int[2]-vn.int[1],x=my.i2,p)
      }
    }

  if (n.interim>2)
    for (my.i1 in (v.crit[1] + 1):vn.int[1]) {
      for (my.i2 in (v.crit[2]+1 - my.i1):(vn.int[2]-vn.int[1] )) {
        for (my.i3 in 0:(v.crit[3] - my.i1 - my.i2 )) {
          probstop[3] <- probstop[3] +

            dbinom(size=vn.int[1],x=my.i1,p)*
            (my.i2 >= 0)*dbinom(size=vn.int[2]-vn.int[1],x=my.i2,p)*
            (v.crit[3] - my.i1 - my.i2  >= 0)*dbinom(size=vn.int[3]-vn.int[2],x=my.i3,p)

        }
      }
    }

  if (n.interim>3)
    for (my.i1 in (v.crit[1] + 1):vn.int[1]) {
      for (my.i2 in (v.crit[2]+1 - my.i1):(vn.int[2]-vn.int[1] )) {
        for (my.i3 in (v.crit[3]+1 - my.i1 - my.i2):(vn.int[3]-vn.int[2] )) {
          for (my.i4 in 0:(v.crit[4]- my.i1 - my.i2 - my.i3 )) {
            probstop[4] <- probstop[4] +

              dbinom(size=vn.int[1],x=my.i1,p)*
              (my.i2 >= 0)*dbinom(size=vn.int[2]-vn.int[1],x=my.i2 ,p) *
              (my.i3 >= 0)*dbinom(size=vn.int[3]-vn.int[2],x=my.i3 ,p) *
              (v.crit[4] - my.i3 - my.i2 - my.i1 >= 0)*dbinom(size=vn.int[4]-vn.int[3],x=my.i4 ,p)

          }
        }
      }
    }

  if (n.interim>4)
    for (my.i1 in (v.crit[1] + 1):vn.int[1]) {
      for (my.i2 in (v.crit[2]+1 - my.i1):(vn.int[2]-vn.int[1] )) {
        for (my.i3 in (v.crit[3]+1 - my.i1 - my.i2):(vn.int[3]-vn.int[2] )) {
          for (my.i4 in (v.crit[4]+1 - my.i1 - my.i2 - my.i3):(vn.int[4]-vn.int[3] )) {
            for (my.i5 in 0:(v.crit[5] - my.i1 - my.i2 - my.i3 - my.i4)) {

              probstop[5] <- probstop[5] +

                dbinom(size=vn.int[1],x=my.i1,p)*
                (my.i2 >= 0)*dbinom(size=vn.int[2]-vn.int[1],x=my.i2 ,p) *
                (my.i3 >= 0)*dbinom(size=vn.int[3]-vn.int[2],x=my.i3 ,p) *
                (my.i4 >= 0)*dbinom(size=vn.int[4]-vn.int[3],x=my.i4 ,p) *
                (v.crit[5]- my.i4 -my.i3 - my.i2 - my.i1 >= 0)*dbinom(size=vn.int[5]-vn.int[4],x=my.i5 ,p)
            }
          }
        }
      }
    }

  if (n.interim>5)
    for (my.i1 in (v.crit[1] + 1):vn.int[1]) {
      for (my.i2 in (v.crit[2]+1 - my.i1):(vn.int[2]-vn.int[1] )) {
        for (my.i3 in (v.crit[3]+1 - my.i1 - my.i2):(vn.int[3]-vn.int[2] )) {
          for (my.i4 in (v.crit[4]+1 - my.i1 - my.i2 - my.i3):(vn.int[4]-vn.int[3] )) {
            for (my.i5 in (v.crit[5]+1 - my.i1 - my.i2 - my.i3 - my.i4):(vn.int[5]-vn.int[4] )) {
              for (my.i6 in 0:(v.crit[6] - my.i1 - my.i2 - my.i3 - my.i4 - my.i5)) {

              probstop[6] <- probstop[6] +

                dbinom(size=vn.int[1],x=my.i1,p)*
                (my.i2 >= 0)*dbinom(size=vn.int[2]-vn.int[1],x=my.i2 ,p) *
                (my.i3 >= 0)*dbinom(size=vn.int[3]-vn.int[2],x=my.i3 ,p) *
                (my.i4 >= 0)*dbinom(size=vn.int[4]-vn.int[3],x=my.i4 ,p) *
                (my.i5 >= 0)*dbinom(size=vn.int[5]-vn.int[4],x=my.i5 ,p) *
                (v.crit[6]- my.i5 - my.i4 -my.i3 - my.i2 - my.i1 >= 0)*dbinom(size=vn.int[6]-vn.int[5],x=my.i6 ,p)
              }
            }
          }
        }
      }
    }

  if (n.interim>6)
    for (my.i1 in (v.crit[1] + 1):vn.int[1]) {
      for (my.i2 in (v.crit[2]+1 - my.i1):(vn.int[2]-vn.int[1] )) {
        for (my.i3 in (v.crit[3]+1 - my.i1 - my.i2):(vn.int[3]-vn.int[2] )) {
          for (my.i4 in (v.crit[4]+1 - my.i1 - my.i2 - my.i3):(vn.int[4]-vn.int[3] )) {
            for (my.i5 in (v.crit[5]+1 - my.i1 - my.i2 - my.i3 - my.i4):(vn.int[5]-vn.int[4] )) {
              for (my.i6 in (v.crit[6]+1 - my.i1 - my.i2 - my.i3 - my.i4 - my.i5):(vn.int[6]-vn.int[5] )) {
                for (my.i7 in 0:(v.crit[7] - my.i1 - my.i2 - my.i3 - my.i4 - my.i5 - my.i6)) {

                probstop[7] <- probstop[7] +

                  dbinom(size=vn.int[1],x=my.i1,p)*
                  (my.i2 >= 0)*dbinom(size=vn.int[2]-vn.int[1],x=my.i2 ,p) *
                  (my.i3 >= 0)*dbinom(size=vn.int[3]-vn.int[2],x=my.i3 ,p) *
                  (my.i4 >= 0)*dbinom(size=vn.int[4]-vn.int[3],x=my.i4 ,p) *
                  (my.i5 >= 0)*dbinom(size=vn.int[5]-vn.int[4],x=my.i5 ,p) *
                  (my.i6 >= 0)*dbinom(size=vn.int[6]-vn.int[5],x=my.i6 ,p) *
                  (v.crit[7]- my.i6 - my.i5 - my.i4 -my.i3 - my.i2 - my.i1 >= 0)*dbinom(size=vn.int[7]-vn.int[6],x=my.i7 ,p)
                }
              }
            }
          }
        }
      }
    }

  if (n.interim>7)
    for (my.i1 in (v.crit[1] + 1):vn.int[1]) {
      for (my.i2 in (v.crit[2]+1 - my.i1):(vn.int[2]-vn.int[1] )) {
        for (my.i3 in (v.crit[3]+1 - my.i1 - my.i2):(vn.int[3]-vn.int[2] )) {
          for (my.i4 in (v.crit[4]+1 - my.i1 - my.i2 - my.i3):(vn.int[4]-vn.int[3] )) {
            for (my.i5 in (v.crit[5]+1 - my.i1 - my.i2 - my.i3 - my.i4):(vn.int[5]-vn.int[4] )) {
              for (my.i6 in (v.crit[6]+1 - my.i1 - my.i2 - my.i3 - my.i4 - my.i5):(vn.int[6]-vn.int[5] )) {
                for (my.i7 in (v.crit[7]+1 - my.i1 - my.i2 - my.i3 - my.i4 - my.i5 - my.i6):(vn.int[7]-vn.int[6] )) {
                  for (my.i8 in 0:(v.crit[8] - my.i1 - my.i2 - my.i3 - my.i4 - my.i5 - my.i6 - my.i7)) {

                  probstop[8] <- probstop[8] +

                    dbinom(size=vn.int[1],x=my.i1,p)*
                    (my.i2 >= 0)*dbinom(size=vn.int[2]-vn.int[1],x=my.i2 ,p) *
                    (my.i3 >= 0)*dbinom(size=vn.int[3]-vn.int[2],x=my.i3 ,p) *
                    (my.i4 >= 0)*dbinom(size=vn.int[4]-vn.int[3],x=my.i4 ,p) *
                    (my.i5 >= 0)*dbinom(size=vn.int[5]-vn.int[4],x=my.i5 ,p) *
                    (my.i6 >= 0)*dbinom(size=vn.int[6]-vn.int[5],x=my.i6 ,p) *
                    (my.i7 >= 0)*dbinom(size=vn.int[7]-vn.int[6],x=my.i7 ,p) *
                    (v.crit[8]- my.i7 -my.i6 - my.i5 - my.i4 -my.i3 - my.i2 - my.i1 >= 0)*dbinom(size=vn.int[8]-vn.int[7],x=my.i8 ,p)
                  }
                }
              }
            }
          }
        }
      }
    }

  if (n.interim>8)
    for (my.i1 in (v.crit[1] + 1):vn.int[1]) {
      for (my.i2 in (v.crit[2]+1 - my.i1):(vn.int[2]-vn.int[1] )) {
        for (my.i3 in (v.crit[3]+1 - my.i1 - my.i2):(vn.int[3]-vn.int[2] )) {
          for (my.i4 in (v.crit[4]+1 - my.i1 - my.i2 - my.i3):(vn.int[4]-vn.int[3] )) {
            for (my.i5 in (v.crit[5]+1 - my.i1 - my.i2 - my.i3 - my.i4):(vn.int[5]-vn.int[4] )) {
              for (my.i6 in (v.crit[6]+1 - my.i1 - my.i2 - my.i3 - my.i4 - my.i5):(vn.int[6]-vn.int[5] )) {
                for (my.i7 in (v.crit[7]+1 - my.i1 - my.i2 - my.i3 - my.i4 - my.i5 - my.i6):(vn.int[7]-vn.int[6] )) {
                  for (my.i8 in (v.crit[8]+1 - my.i1 - my.i2 - my.i3 - my.i4 - my.i5 - my.i6 - my.i7):(vn.int[8]-vn.int[7] )) {
                    for (my.i9 in 0:(v.crit[9] - my.i1 - my.i2 - my.i3 - my.i4 - my.i5 - my.i6 - my.i7 - my.i8)) {

                    probstop[9] <- probstop[9] +

                      dbinom(size=vn.int[1],x=my.i1,p)*
                      (my.i2 >= 0)*dbinom(size=vn.int[2]-vn.int[1],x=my.i2, p) *
                      (my.i3 >= 0)*dbinom(size=vn.int[3]-vn.int[2],x=my.i3 ,p) *
                      (my.i4 >= 0)*dbinom(size=vn.int[4]-vn.int[3],x=my.i4 ,p) *
                      (my.i5 >= 0)*dbinom(size=vn.int[5]-vn.int[4],x=my.i5 ,p) *
                      (my.i6 >= 0)*dbinom(size=vn.int[6]-vn.int[5],x=my.i6 ,p) *
                      (my.i7 >= 0)*dbinom(size=vn.int[7]-vn.int[6],x=my.i7 ,p) *
                      (my.i8 >= 0)*dbinom(size=vn.int[8]-vn.int[7],x=my.i8 ,p) *
                      (v.crit[9]- my.i8 - my.i7 -my.i6 - my.i5 - my.i4 -my.i3 - my.i2 - my.i1 >= 0)*dbinom(size=vn.int[9]-vn.int[8],x=my.i9 ,p)
                    }
                  }
                }
              }
            }
          }
        }
      }
    }

  if (n.interim>9)
    for (my.i1 in (v.crit[1] + 1):vn.int[1]) {
      for (my.i2 in (v.crit[2]+1 - my.i1):(vn.int[2]-vn.int[1] )) {
        for (my.i3 in (v.crit[3]+1 - my.i1 - my.i2):(vn.int[3]-vn.int[2] )) {
          for (my.i4 in (v.crit[4]+1 - my.i1 - my.i2 - my.i3):(vn.int[4]-vn.int[3] )) {
            for (my.i5 in (v.crit[5]+1 - my.i1 - my.i2 - my.i3 - my.i4):(vn.int[5]-vn.int[4] )) {
              for (my.i6 in (v.crit[6]+1 - my.i1 - my.i2 - my.i3 - my.i4 - my.i5):(vn.int[6]-vn.int[5] )) {
                for (my.i7 in (v.crit[7]+1 - my.i1 - my.i2 - my.i3 - my.i4 - my.i5 - my.i6):(vn.int[7]-vn.int[6] )) {
                  for (my.i8 in (v.crit[8]+1 - my.i1 - my.i2 - my.i3 - my.i4 - my.i5 - my.i6 - my.i7):(vn.int[8]-vn.int[7] )) {
                    for (my.i9 in (v.crit[9]+1 - my.i1 - my.i2 - my.i3 - my.i4 - my.i5 - my.i6 - my.i7 - my.i8):(vn.int[9]-vn.int[8] )) {
                      for (my.i10 in 0:(v.crit[10] - my.i1 - my.i2 - my.i3 - my.i4 - my.i5 - my.i6 - my.i7 - my.i8 - my.i9)) {

                      probstop[10] <- probstop[10] +

                        dbinom(size=vn.int[1],x=my.i1,p)*
                        (my.i2 >= 0)*dbinom(size=vn.int[2]-vn.int[1],x=my.i2 ,p) *
                        (my.i3 >= 0)*dbinom(size=vn.int[3]-vn.int[2],x=my.i3 ,p) *
                        (my.i4 >= 0)*dbinom(size=vn.int[4]-vn.int[3],x=my.i4 ,p) *
                        (my.i5 >= 0)*dbinom(size=vn.int[5]-vn.int[4],x=my.i5 ,p) *
                        (my.i6 >= 0)*dbinom(size=vn.int[6]-vn.int[5],x=my.i6 ,p) *
                        (my.i7 >= 0)*dbinom(size=vn.int[7]-vn.int[6],x=my.i7 ,p) *
                        (my.i8 >= 0)*dbinom(size=vn.int[8]-vn.int[7],x=my.i8 ,p) *
                        (my.i9 >= 0)*dbinom(size=vn.int[9]-vn.int[8],x=my.i9 ,p) *
                        (v.crit[10] - my.i9 - my.i8 - my.i7 -my.i6 - my.i5 - my.i4 -my.i3 - my.i2 - my.i1 >= 0)*dbinom(size=vn.int[10]-vn.int[9],x=my.i10 ,p)
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }

  #probstop <- round(100*probstop, digits = 2)
  probstop=data.frame(Int.Analysis=1:length(vn.int),Pat.number=vn.int,Crit.boundary=v.crit,P.stop=round(probstop, digits = 4),P.stop.cum=round(cumsum(probstop), digits = 4) )
  probstop
}




