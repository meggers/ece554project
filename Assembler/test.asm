##############################################
#                                            #
#   This is a test assembly program.         #
#   It is only meant to test the assembler   #
#   Do not run this program                  #
#   Please                                   #
#                                            #
##############################################
#                                            #
#   Data Section                             #
#                                            #
##############################################
                                             
test:       add $at,$at,$at
            and $at,$at,$at

##############################################
#                                            #
#   Start Instructions                       #
#                                            #
##############################################

.text

lookie:     add $at,$at,$at
            sub $a0,$at,$at

iam:        addi $at,$at,$at

thatare:    move $at,$at,$at
            andi $at,$at,$at

##############################################
#                                            #
#   End Instructions                         #
#                                            #
##############################################