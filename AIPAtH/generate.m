function randompermutation(array)
    res := [];
    while not IsEmpty(array) do
        r := Random(array);
        Exclude(~array,r);
        Append(~res,r);
    end while;
    return res;
end function;

load "utils.m";
printf "%o: %o rounds\n", name, r;
msg := assigned msg select msg else "Hello world\n";
msg := stringtobits(msg);
printf "equations generation : ";
time F, xm, xh := equations();
h := hash(msg);
R := Universe(F);
m := pad(msg);
zeroeqs := [xm[i] : i in [1..#xm]];
oneeqs := [xm[i] + One(GF(2)) : i in [1..#xm]];
msgeqs := [xm[i] + m[i] : i in [1..#xm]];
randeqs := [xm[i] + Random(GF(2)) : i in [1..#xm]];
hasheqs := [xh[i] + h[i] : i in [1..#xh]];
dir := Sprintf("%o/r%o", name, r);
System("mkdir -p " cat dir);
System("rm -f " cat dir cat "/F.anf");
System("rm -f " cat dir cat "/z.anf");
System("rm -f " cat dir cat "/zp.anf");
System("rm -f " cat dir cat "/i.anf");
System("rm -f " cat dir cat "/ip.anf");
System("rm -f " cat dir cat "/m.anf");
System("rm -f " cat dir cat "/mp.anf");
System("rm -f " cat dir cat "/r.anf");
System("rm -f " cat dir cat "/rp.anf");
System("rm -f " cat dir cat "/h.anf");
printf "dump anf : ";
t := Cputime();
dump(F, dir cat "/F.anf");
dump(zeroeqs, dir cat "/z.anf");
dump(oneeqs, dir cat "/i.anf");
dump(msgeqs, dir cat "/m.anf");
dump(randeqs, dir cat "/r.anf");
dump(randompermutation(zeroeqs), dir cat "/zp.anf");
dump(randompermutation(oneeqs), dir cat "/ip.anf");
dump(randompermutation(msgeqs), dir cat "/mp.anf");
dump(randompermutation(randeqs), dir cat "/rp.anf");
dump(hasheqs, dir cat "/h.anf");
print Cputime(t);
exit;