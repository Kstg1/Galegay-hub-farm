local _X=bit32
local _Y="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
local _D={}
for _i=1,#_Y do _D[string.sub(_Y,_i,_i)]=_i-1 end
local _B={
    "2Zko//j9tf0ZOp+iLkd4g5iArjmwZPzGK2jFQbYY0OVcHmR74Gr+XsKFgeAbznSgkcpWq/Pc783PDqc0tvDVMfnarJkeFVUw/uLa",
    "BF1Qe+XiLqKcbyXqCL179DF9Qgs2O4JlX3MNZh06LwZK9miN4/5WIukg9SpeOlnytre34/UrtShJIZ6fvssGXRHkXzg92RwXC3cM",
    "fIyc5uyV4lzNkmZgA/iJEyG09/b6Y8WAQtW+LyRNCI7SaJ+MHNFVN63SaRRYvn8x1nxJDLPegZeiQ9MLzpnYd5OgHJeBF7dbAZQU",
    "RkWGKiRcHXXQVRF6DPlR80VMbCvoKu1YTd9y5LPI9uTKEKkxpVEFvdauxD0VEmXGL8PDgdlMyGB5XjFWfY1ebFhgHcv/W02+xCKX",
    "6GlYplky8+hmRtXQ1E6CdYeJWrUW4URtCYaAeZ+AdoBnSAb21XtDzk+j+81Py8b/tqcuU9KcjJl+RozzX5mwIvV7P6WtBeONwsir",
    "KVK34aGIhgFZLrede/ewwb3FLTMxIigYA7+tPkkFx1AbV8Mv1had8KUqMZDztcpr2InqmjGgdwxiiubwKvPRFUyvj3u9VdZKsyA+",
    "SLmwPw6/xCmjhHyADyUbgjxw3UYeixRTnLETmJKS0rWp35NNRj2rFBrQKdxqZoWwVhnsSv79ojH/Mwbd1dWGJeybNXkPPgMHSpGl",
    "16/TEU+ZqafwOS+1OktzxSUZES7ieJkC5Eot+5q75xQMxTW6jzj8ujtQ7nbvHuGdHM50RW5kP8+Rfn0yUb9SBK4ExwuqO4kCMGg+",
    "wz6glcSD8TVWXow/eVq+mv0qtBH4w6pobT6A7Ru1Xk3xm/jrBnzJcezMbQm9mPL5AHgZRg0EkfVv9HZidy9bSkglq3EkWtbNholo",
    "n9s3nC296679tpEdI+HmHemx1awpvnIv9OaJQ+VjJ6t7nrVf+CdDwgF3oaF2nSoiTP+3Sj3igLl9FHS80poXoun2kGAp2xm0pFRf",
    "ppUIi2k98AkdqVpOWAFftiCiib1B/RdXKw2KS3j1IAIbg7fvVUkoeH6CfbY+V+YkooVy6V9pgtSNdlFAA7HpyDrpgFxugzJcD10L",
    "JiW30XU7Mwg1yAkXjz8Wjeb0BFzWEOVFMziMT1E8CozA0yGOeHVgb8JUXYIFOi0PtQ9palgy5p0ufknYlNQeD5LctmZ766VyrqIp",
    "Rzy2ufo632HniUZGTosVCjezEM2/zlB1pnbBkrfX4/jIdaHqKXfGUIVU6oW7wy5wazBuaS0PjGEpGJLiLDGqn39qa43u0JztguqS",
    "QPJ1VNn3Zvfpfe2aFoYi4ZfgOxSxybguGRSWOSHyRe0g22DXb3gTZv18vigGJLCk8CPCBYn5w3pPSwINwvyLP/UTIqr9dS45yi/1",
    "kdG6uFl/nDGJHvqNO31niopca6GeoWiH0MnDTVe+pRByd5bNcqRGfbxmLc7Sey7Y/JHBQmniY6LUz14EZ505jcP5dsrwUWEugtmT",
    "3JLyYRJcJnb5z5X89sDYF2KPKDFo+wES7UBa4a3AfMU+h91fqGs3IlUQAO4bIpkZo8YKuWLT11UYy1UINWDoVsbx3ljaTHES7a1p",
    "faoOGnPh7a0DdSjIl32IsG6M78l0IuWsVD3eh+st9MW0bgbKmXXAicPvoXFx5+CUA/ib3BIw7J2wFOLpqh3LYaTd3AmLulhsNZ1x",
    "NRUgFPVsD7UsVSnIOIPrepGXlDnWheBCikb7VY5u614jhnDiEK1z87nbrRVlDZx+5ZMJKTWa0PXeH77n71QeajUiA1JC8e0QPQ5Y",
    "1N3ElhZrAyPjwjrrV/lJ/q9UEwZVrPTDvuVTkwswIg/fmlziXzFoipaNURvXoTl/YR3g4n7YcAyicKsDren6ESbrsOahRcvqb2e0",
    "j45BVPYBS9dMDKGLqIX+qyV+2Gqo4H01AVRQKCsPIoCSaqkBrqEYgHOR34fdSSW179bkvF8t+Ub9b7FqBG89+vQ0TU6aVO2SQzJ9",
    "18mcnEn01ylgpZ9R6jQHpvM4cFVCNzURfcRKqsnrKNEQGvDNCMTg/HYnUj8IQuyMISEIgOULKzkvP/X/zDc+VfXuTXUTGL4uIYJE",
    "WoSi4HPj2GPQdmI2rxVt0MkXk0M0NSwXMsTCZsneqB8uGw1kAst4BTXOh7CrLpW9CWtSBwH8m4MXjPa4dREc8N03JfFiq+n64XzR",
    "sxlV1AB13MKX5bXaKoXZCvwYQB+FuUnTvgOl5hdJl34/DAVBDY1Ph7/kXZTjudRWXzn4jIHbFgoLYlPj1EW2xIlPyBWPcSy6hGTf",
    "DnnWzJLJvE0csX0Xh//AgzLbQqLIyCsT/E2+8xevF/WUV0WYqyHyaT8bT/NdlxEim/Eyye9FbkyYgd3LC5hrQuJP8/LN0hnMimRR",
    "9CJJ1g9EQxW4XNDzRocUyt7fC2HwJqZxxH+sHAmKMj1sGqmrzu1YphQOGczK87rUKGePd9XaI1QedDd4TKkKe285xCVUYE22s95/",
    "zinlS53rXISpLCG2U1VErqnlFcfZcQ/lJoOYlFf6TPiKgsC0GOC6Y0FZVd5ekfYufoB1dY3MFxcvd/XgAonnZnl2Glkm8iQUwrTY",
    "9XUBnlrR11aq2id8VaGvlLtNb1JKLRFw7g10OQ26zHq8sA6T9vkNfzrs5iYwh6qBtdVwZ+UenLcswyKp6AIyVXq2MP6l3KE99426",
    "8GuKcTMOYwLSdglQ03fSQAxpbxSGA6VA2G5kN86bBxFWDYGfLD/p9lQV0kXFT5kU3aIlOSCiDA4MFVn8DE4BHSHe5uL9QAX+giuJ",
    "fhUY6LTYfCEuGwldotADPZ2emzlCt13PA56Ii3nCFolBZI9dYlKNk3SigzUsDvajvKgJhpv6YrQicv3WBD4N7Rn+150CKgZIfEFi",
    "ako952muLLLnYKgqRwpLt+V7gH08KaF8EUblmcHKIgvc4pP6nekawc0qJCcigMohI29DIBnUDRwsC/2+8uSns1foFEBg1Q0Ts8W9",
    "bCEf5IQdaLTdYi2oZB0l5Od7iNN40viIYAmdNdUl+5L4piK/tAVoFoD8tVQwjnm1k3HexIaT6FD2zFUTA02uL88xbTcpg0VfHglj",
    "epGXG9nEUrYx46SYtgEexVENTu+8EWHWCMSIKvwyrZCrQahdmVlBIduRMLZnVgnlc8ciofg4Y5pvSfW9fQm+WSb5CnovY9EIVyQv",
    "yJv3XKAOhk3Bfu1LbjO34bulu1kq8cBArkEltAZzeRUWuRF/eXa4u8jO6nKwGhswJLQfFSRnP+1OHDWYGMUjq5N3of2pJWmsJLJD",
    "YtAh4QLmJ+RLZDkDaItqpGG6BadQficXvWtLFaqeElPR3R5BQ3BPfHnTKMSia7WNEgQUOrXJMpwhaFrtG8LkM8GVHyYHuaOBb/gt",
    "Z3/kQB5rmIny8MGUnC1f+O5Ib4fbxcqFwpUOPZTwDLRUy20a1aS7w1JXhpE7Hy3NMTnOwE2maCnt6favu3kHcEyfEXHpddSpl5Ul",
    "nMwOY800Pmmh5RHZ1/CzSF0AynzN0Thw6irVo0yXU19o4vl0zKr+hmu0arCOLNXTJtyO+QD9LmhXsZR1L9lNQGcQFmTolMzfM0cT",
    "fp0WANjD0DgbPS/4Ib831VN2UaRDZlDskKrBoBZLrHEgULZEAD7ULSDYBm2D6ZK0PSeG2K3KT0kljCiXbFNisbmkNAPN6lRica1O",
    "i3FTFVOv5tZKZ5tN3eXqOT1vm9bFqgykY1L+i/nejjbiNY9WN+uLebX71OqviqYwc1Kn0IGBgXy3WE1djiS+8PnqABTs/aQbEik7",
    "xg4mHQsPLDPw5EGeDNXdk8ND3RBR7oO4N6HWJWCbBoVHJ/2es334s/JVAIIrwkngZ7mJFclisAISlRMNQGXs9UBuecUom9q7oND4",
    "g/zSMZI77GjI2AgsGCb8jnkgc4n1e8mK6UbxtN5eRHncvvcQ2YJ5RcT3ey0qXJEkuLnljLeJrGicbu0cXdgXBLnMIR4TddEMOXIY",
    "O7y19eZ6RK3co/6o8q5u+0Te6MLGs59q5kOWNOi1FIW3b+k6Sw6413e4+K2fY/CzDjMwptHJVCVgpV/pdehvrndqjyD0hOLD2MBA",
    "/jTmxT513PFjIou8u2QyJhlzE3PiBxWWFbP3uQW3qER2V1q9SbYXyEJWbzX9U/lbz58yFF57OCk1qewOMqV+lVm/lvpIMFr/fhnS",
    "6zNU8vevoD6WCnkb57F+sDond7vAXz81xA23kWGW636Rnup0iGxLQPfZarfUtwVIvgd4oNEXnFS0ukcrYnNe8FfqlG/LDkTZn/2A",
    "iaOTWjtAktT+T0nS33CENk2qEnPxF/NL2S9hjRMW6TyHI1XSc+TYIxOuqCtdT10Q5WTCh3xmRnrTmFkAU8znXTfQFQeXimZTeYiR",
    "rSnVGHmxGsllv3wDsu2CbWe6fx35ZIwXtpJc5jA/hmmrhRzM/Y9/5Om+DrWREs77/R9Hyis0hPFpUF5ffvZzHrcHNc16p8ILogMb",
    "o9XknFvtRL+0CTB1+JNhU6ahjlzggk6Ae5+0YdHUD2GSkaHN3GvknsUIV7TgqoIEUE7pL3/3eZ+L0BxpJQG70APCHd26X95hS17M",
    "p6Gl6SId9zaKfRMdwN3MuDp4JSfxAW3S5jmwDwuTHJbS/bKV9sWCjmDRMUKCiSWrEPGFRIepT//xLM+7GulChqqVFQ4isCzv+nkM",
    "IUd7+BWV9NjPauVBgFskG2B6swB0mVEJoIHklufMuGqn/w13ZPVjLcqWZ+ALBlg109zBbkPWNQJYgqU2M6UT2rPqGSsitPGttYf9",
    "zes2jFUmQe3EiMmEuPkgbFCordmpwSRUD3wa2CAWDtXCC3vPP1+36mhSrlGz4198++d2QmiZRS78n+BpRZzHwdegMmmkGu+iLpYp",
    "lgrF7AW1PyUShnbGHGkiJzV8uaFWpepL7ybLmr1EYljQocXHANvGdpxmV/J9R6mnIygNHsXXoQvS6jTySbDociFtTR4pSx6xg9cF",
    "+bS/AhYJrcEwJx3vakkwM30a8GgW9UvGbfWpkxXeEmIw+KM7A5S5Krc+SphXbdJgll3S0c81CZdM0TTGYYBPP4RJHAwrurd24/OH",
    "bDIRdBAcqXbJXtFhXmSyH0SNrGO78x1eYq74J5Ool4RHdHmieyq8/GpZStK+apWqTXotBZdcXi0xPuHM9+f3bzw1rR42NZcexmQW",
    "mvbCYNQHComX5KZPuJ+7oShCfxPMSCOIwdp4JKu5z6GUvuM9OlUAS55lFZ2u1NJsbNqwuDunW4y3aU30W9BHnIM2RxGYfmvcuS9V",
    "3pQsFprKvAKbT/8uTtJbps/x+alQmvY9kxAx2Jm+mXrqOjuEZ0oCA6X2mTob79WfDriBReb1qfr6ZM3ivaBcDHv95xu4oUZ4Ru6n",
    "4iv8Nyb6rp1EMJKIvxJVuYO17MwPGFAyMCG8hbMo2mRVb4YDQ20RIBxwG3Ro8oTp94lTupMMjRvwwm2ziUVNjjex22s451+v4usf",
    "JlzGEm8XgjZLPaRP3JKmbll664CUxx1m/f6r9AKBdGLUNEXw1ySGsXQPR0oz1HOLkPCuiXmFyvoTqp3uaIP/aMhmVqt9ARk1oD3e",
    "hO/TJYAQntU6nLO+p1FaTV0VG4Nx59hHNP+/fnKjYJisrRAjsTMsgc7lH07WcXR6maN7zrMxBX7XGrVD1w4t3sRoL4uPVlWCcUV1",
    "Km6AM11I+B3WiHJzs1t7vXk4ow2I00ovhRfdU1WmjGxmqh+xi/c+jvXdagYRuIqc3GYxpukK8YCVrWOC5IC0kokW4lq+JCJGLvAp",
    "Bi1dVjDW//N6f04OMJHiiTzoODqzivSwu504kbAY6gLlEuAdm0kHH1oWQ8uz5ayWgPX/zAjMCDmH61F/W1E4B1pka/FFd/pTDxGS",
    "NU01hDLTwAZBfgPJLuynVZdjCC03WnxXS3e2J+sgpShvoRBpDScgFbf+3HPr5kTtUwnCIjERccNzXOzmBuwy1ZC1RjcJ3fUIzMjN",
    "z0gc6SNSDWGNDYH19zpFn4JvNbsuz7IVpbQKIewbasyFcMUlxkLI9cHXt8Xtn0XyN7/4ebLMYZLgq+iMxTMQZ5od6fwSXcNpefAP",
    "0o8g0UGqsSztdidaAQ8hUcIQok9bQQypqxKwGVEEbgCPt3wX/sKWlTtKS8elICMnDPIZCa3cTUXVADKBaZEG6OVtyLlh7MmhWDyt",
    "IzFzgFtVh44lwf1WxMGCReg8l0sLvVE2t7sMz3c3UMDpi6PFcL5DTnXNphtukqcqHrHOzyEMUSXT1jv7VK6x1a377ZGaJe0AKBNA",
    "z5GJEfQetmaMktUexd1Et5FsuAYc2CUMm2gwc2DtD/NKp2SbQOwPXqPgkQAWWGlX47JL/cGzZmv5nlP+n0FXT+I3bo5yH7HCVuq0",
    "mU+mvclACZncIjrAh7qLC3wEwRrkvQG0ZGcJFbJTT7XFnhQe74/xG5sOaImTbkHujYNnNgLf9Rj2F3W8XEYVs8TEMoqEHy5PZZye",
    "xUfIyXXeWPOxv0wRy2ZpMCHhnNOWhlehHuIZ3H0Txiqs7JhTo4NrOfpISYzTsdIGc7SAQbELQJlWx6UuZv41kRGZak+UyRERzA26",
    "Ef2oK4bwmY2rUtd3hvIBdlnxixrKFeIVieVqoDbaBnrhLkyFEeS6Px0a7nGTf0NWU83ukLArI0JHzlkWP30Xg3CDLjsnlFcr2Fcj",
    "FuP+0P7vEtrt5lGAhYHTdPvL5i0uNU0qerGD6B3nLBpVt5umrYftGuOdgsBi5R2o1gcZB+jRjisPcmnTXk+66FDH5v2QJJ1A8HCY",
    "UmCl87+krPskyfTJ5uKnf9qFjHWVWBzX0Mi+KazLiVG7Yn+Lqo/QKRFp4G35G+YoJpRPnJoduDlmaCU95Fs74v6ZjjEbIR348GgY",
    "x6iLo82xgiRjKNHYPenD0Zn5Yfu54tpjw+PeJb5lbh5dLi54JwBMmKV175nbCSQqmOoOug+libLeARoW7+cp7XogrdTqfxnFIlFv",
    "ZsBOOBfDaiNSRiTIUjXxy69cLycYS8fu5vH9WTeXptnzffUX/z1hfEqn7n2wI+HOIG6RZfiQJGPz9woA7UV9O5Dj2SsT+Yfd11Xs",
    "DVsxD6DATlnWFz2wOnoulDxwlPRQR1HOw5rWEVUT8ebh+lWaXFljRIzFJaBkXWGy8Hg/Hv1y/dsamc0NY61jJAUpgJeNMaWEeXMn",
    "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",
}
local _state=1728301813
local _bytes={}
local _acc,_nbits,_idx=0,0,0
for _block=1,#_B do
    local _s=_B[_block]
    for _i=1,#_s do
        local _c=string.sub(_s,_i,_i)
        if _c=="=" then break end
        local _v=_D[_c]
        if _v==nil then error("Payload invalido") end
        _acc=_acc*64+_v
        _nbits=_nbits+6
        if _nbits>=8 then
            _nbits=_nbits-8
            local _p=2^_nbits
            local _enc=math.floor(_acc/_p)
            _acc=_acc%_p
            _idx=_idx+1
            _state=(_state*1664525+1013904223)%4294967296
            local _mask=_X.band(_X.rshift(_state,(_idx%4)*8),255)
            _bytes[_idx]=_X.bxor(_enc,_mask)
        end
    end
end
local _codes={}
_acc,_nbits=0,0
for _i=1,#_bytes do
    _acc=_acc*256+_bytes[_i]
    _nbits=_nbits+8
    if _nbits>=12 then
        _nbits=_nbits-12
        local _p=2^_nbits
        _codes[#_codes+1]=math.floor(_acc/_p)
        _acc=_acc%_p
    end
end
local _dict={}
for _i=0,255 do _dict[_i]=string.char(_i) end
local _next=256
local _previous=nil
local _output={}
local _a,_b=1,0
for _i=1,#_codes do
    local _code=_codes[_i]
    local _entry=_dict[_code]
    if not _entry then
        if _code==_next and _previous then
            _entry=_previous..string.sub(_previous,1,1)
        else
            error("Protecao: codificacao invalida")
        end
    end
    _output[#_output+1]=_entry
    for _j=1,#_entry do
        _a=(_a+string.byte(_entry,_j))%65521
        _b=(_b+_a)%65521
    end
    if _previous and _next<4096 then
        _dict[_next]=_previous..string.sub(_entry,1,1)
        _next=_next+1
    end
    _previous=_entry
end
local _decoded=table.concat(_output)
if #_decoded~=24205 or _b*65536+_a~=3795717318 then
    error("Protecao: integridade do arquivo falhou")
end
local _run,_err=loadstring(_decoded)
if not _run then error(tostring(_err)) end
return _run()
