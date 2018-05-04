#include <ctime> 
#include <iostream> 
#include <random> 
using namespace std;

extern "C" void prodint(float* vecX, float* vecY, int N, float* res);
extern "C" void prodintSIMD(float* vecX, float* vecY, int N, float* res);

// Numero de repetições (invocação da função) 
const unsigned NREP = 100000;

// Numero de elementos dos vetores 
const unsigned NELEM = 10000;

// garantir alinhamento correto 
_declspec(align(16)) float seqX[NELEM];
_declspec(align(16)) float seqY[NELEM];

int main()
{
	clock_t startTime, endTime;
	float res1;
	double tempo1, tempo2;

	// preeencher com valores pseudo-aleatórios 
	default_random_engine generator;
	uniform_real_distribution<float> distribution(-10.0f, 10.0f);
	for (int j = 0; j < NELEM; j++)
	{
		seqX[j] = distribution(generator);
		seqY[j] = distribution(generator);
	}

	// início da contagem de tempo 
	startTime = clock();
	for (int n = 0; n<NREP; n++)
		prodint(seqX, seqY, NELEM, &res1);
	endTime = clock(); // fim da contaem de tempo
	tempo1 = double(endTime - startTime) / CLOCKS_PER_SEC;
	cout << "[prodint " << NELEM << "x" << NREP << "]\t\tTempo gasto (s): " << tempo1 << endl;

	// início da contagem de tempo 
	startTime = clock();
	for (int n = 0; n<NREP; n++)
		prodintSIMD(seqX, seqY, NELEM, &res1);
	endTime = clock(); // fim da contaem de tempo
	tempo2 = double(endTime - startTime) / CLOCKS_PER_SEC;
	cout << "[prodintSIMD " << NELEM << "x" << NREP << "]\t\tTempo gasto (s): " << tempo2 << endl;

	// mais código ...
	getchar();
	return EXIT_SUCCESS;
}