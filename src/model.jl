export spinmodel
# spin model 

function spinmodel(g = (1,1,1), h = (0,0,0) ; sitetype = "Spinhalf")
    SI = op("SI", sitetype) 
    Sx = op("Sx", sitetype)
    Sy = op("Sy", sitetype)
    Sz = op("Sz", sitetype)
    # @tensor h[:] := a*Sx[-1,-2]*Sx[-3,-4] + b*Sy[-1,-2]*Sy[-3,-4] + c*Sz[-1,-2]*Sz[-3,-4] + 
    #                     d*Sx[-1,-2]*SI[-3,-4] + d*SI[-1,-2]*Sx[-3,-4]

    gx,gy,gz = g
    hx,hy,hz = h
    h = gx*kron(Sx,Sx) + gy*kron(Sy,Sy) + gz*kron(Sz,Sz) +
                        hx*(kron(Sx,SI) + kron(SI,Sx)) + 
                        hy*(kron(Sy,SI) + kron(SI,Sy)) + 
                        hz*(kron(Sz,SI) + kron(SI,Sz))

    h
end


