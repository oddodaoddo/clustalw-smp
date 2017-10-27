install: clustalw

clean:
	rm *.o *.bck *~ core clustalw *.aln *.dnd

OBJECTS = interface.o sequence.o showpair.o malign.o \
  	util.o trees.o gcgcheck.o prfalign.o pairalign.o \
  	calcgapcoeff.o calcprf1.o calcprf2.o calctree.o \
        readmat.o alnscore.o random.o pth_measure.o

HEADERS = general.h clustalw.h

CC	= gcc
CFLAGS  = -c -O3
LFLAGS	= -O -lm -lpthread

clustalw : $(OBJECTS) amenu.o clustalw.o
	$(CC) -o $@ $(OBJECTS) amenu.o clustalw.o $(LFLAGS)

interface.o : interface.c $(HEADERS) param.h
	$(CC) $(CFLAGS) $*.c

amenu.o : amenu.c $(HEADERS) param.h
	$(CC) $(CFLAGS) $*.c

readmat.o : readmat.c $(HEADERS) matrices.h
	$(CC) $(CFLAGS) $*.c

trees.o : trees.c $(HEADERS) dayhoff.h
	$(CC) $(CFLAGS) $*.c

.c.o :
	$(CC) $(CFLAGS) $?
