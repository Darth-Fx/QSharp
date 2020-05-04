namespace Quantum.QSharp.Libs {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    //commit

    operation QB4Run () : (Int,Int,Int,Int,Int,Int,Int,Int,Int,Int,Int,Int,Int,Int,Int,Int)
    {
        body
        {
			mutable num0000 = 0;
			mutable num0001 = 0;
			mutable num0010 = 0;
			mutable num0011 = 0;
			mutable num0100 = 0;
			mutable num0101 = 0;
			mutable num0110 = 0;
			mutable num0111 = 0;
			mutable num1000 = 0;
			mutable num1001 = 0;
			mutable num1010 = 0;
			mutable num1011 = 0;
			mutable num1100 = 0;
			mutable num1101 = 0;
			mutable num1110 = 0;
			mutable num1111 = 0;

            using (qubits = Qubit[4])
            {
                for (test in 1..10000)
                {
                    Set (Zero, qubits[0]);
                    Set (Zero, qubits[1]);
					Set (Zero, qubits[2]);
					Set (Zero, qubits[3]);

					//Demo of pass through (NOP)
					//Set (Zero, qubits[0]);
                    //Set (Zero, qubits[1]);
					//Set (Zero, qubits[2]);
					//Set (Zero, qubits[3]);

					//Demo of NOT gate
					//Set (Zero, qubits[0]);
					//X(qubits[0]);
					//X(qubits[1]);

					//Demo of Hadamard
					//Set (Zero, qubits[0]);
					//H(qubits[0]);

					//Demo of SWAP
					//Set (One, qubits[0]);
					//SWAP (qubits[0],qubits[1]);

					//Demo of Controlled-NOT   ( CNOT )
					//Set (One, qubits[0]);
                    //Set (Zero, qubits[1]);
                    //CNOT(qubits[0],qubits[1]);

					//Demo of Bell State
					//TODO calculate the statevector for the resulting state!!!!

					//Q0 ---------H-----o----------------M
					//                  |
					//Q1 ---------------x----------------M

					//Set (Zero, qubits[0]);
                    //Set (Zero, qubits[1]);
                    //H(qubits[0]);
                    //CNOT(qubits[0],qubits[1]);

					//Demo of Toffoli Gate in general configuration
					//Q0 ---------------o----------------M
					//                  |
					//Q1 ---------------o----------------M
				    //                  |
					//Q2 ---------------x----------------M
					
					Set (One, qubits[0]);
                    Set (Zero, qubits[1]);
					Set (One, qubits[2]);
					CCNOT(qubits[0],qubits[1],qubits[2]);

					//Demo of Toffoli Gate in NOT configuration
					//Set (One, qubits[0]); // Always 1
                    //Set (One, qubits[1]); // Always 1
					//Set (One, qubits[2]); // Input of NOT gate. Gets inverted by NOT
					//CCNOT(qubits[0],qubits[1],qubits[2]);

					//Demo of Toffoli Gate in and configuration
					//Set (One, qubits[0]); // Input 1 of and
                    //Set (One, qubits[1]); // Input 2 of and
					//Set (Zero, qubits[2]);// Initialized to 0. Gets the result of and
					//CCNOT(qubits[0],qubits[1],qubits[2]);

					//Demo of Toffoli Gate in FANOUT configuration
					//Set (One, qubits[0]); // Always 1
                    //Set (One, qubits[1]); // Input & Pass through.
					//Set (Zero, qubits[2]); //Initialized to 0. Gets a result of the fanout from qubits[1]
					//CCNOT(qubits[0],qubits[1],qubits[2]);

					
					
					
                    let res0 = M (qubits[0]);
					let res1 = M (qubits[1]);
					let res2 = M (qubits[2]);
					let res3 = M (qubits[3]);

					if(res0 == Zero and res1 == Zero and res2 == Zero and res3 == Zero){set num0000 = num0000 + 1;}
					if(res0 == One and res1 == Zero and res2 == Zero and res3 == Zero){set num1000 = num1000 + 1;}
					if(res0 == Zero and res1 == One and res2 == Zero and res3 == Zero){set num0100 = num0100 + 1;}
					if(res0 == One and res1 == One and res2 == Zero and res3 == Zero){set num1100 = num1100 + 1;}
					if(res0 == Zero and res1 == Zero and res2 == One and res3 == Zero){set num0010 = num0010 + 1;}
					if(res0 == One and res1 == Zero and res2 == One and res3 == Zero){set num1010 = num1010 + 1;}
					if(res0 == Zero and res1 == One and res2 == One and res3 == Zero){set num0110 = num0110 + 1;}
					if(res0 == One and res1 == One and res2 == One and res3 == Zero){set num1110 = num1110 + 1;}
					if(res0 == Zero and res1 == Zero and res2 == Zero and res3 == One){set num0001 = num0001 + 1;}
					if(res0 == One and res1 == Zero and res2 == Zero and res3 == One){set num1001 = num1001 + 1;}
					if(res0 == Zero and res1 == One and res2 == Zero and res3 == One){set num0101 = num0101 + 1;}
					if(res0 == One and res1 == One and res2 == Zero and res3 == One){set num1101 = num1101 + 1;}
					if(res0 == Zero and res1 == Zero and res2 == One and res3 == One){set num0011 = num0011 + 1;}
					if(res0 == One and res1 == Zero and res2 == One and res3 == One){set num1011 = num1011 + 1;}
					if(res0 == Zero and res1 == One and res2 == One and res3 == One){set num0111 = num0111 + 1;}
					if(res0 == One and res1 == One and res2 == One and res3 == One){set num1111 = num1111 + 1;}
					
					
                }
                Set(Zero, qubits[0]);
				Set(Zero, qubits[1]);
				Set(Zero, qubits[2]);
				Set(Zero, qubits[3]);
            }
            

            return (num0000, num1000, num0100, num1100, num0010, num1010, num0110, num1110, 
					num0001, num1001, num0101, num1101, num0011, num1011, num0111, num1111);

        }
    }

	operation Set (desired: Result, q1: Qubit) : Unit
    {
        body
        {
            let current = M(q1);
            if (desired != current)
            {
                X(q1);
            }
        }
    }
}
