// GreedyAlgorythms.cpp : This file contains the 'main' function.

#include <iostream>

using namespace std;

struct ToPack {
	double weight;
	double value;
};
double Ratio(ToPack a) {
	return a.value / a.weight;
}
void Display(ToPack tab[], int n) {
	for (int i = 0; i < n; i++)
	{
		std::cout << i << ": weight: " << tab[i].weight << ", value: " << tab[i].value << ", ratio: " << Ratio(tab[i]) << endl;
	}
}

int MinimumJoinPairs(int* tab, int n);

void KnapsackProblem();

int main()
{
	// Algorytmy zachłanne
    std::cout << "Greedy Algorithms\n\n";
	// Algorithms making locally optimal decision at each stage
	// (not necessairly optimal overall so the final result might also not be)

	// Minimalisation of joining pairs
	int values[5] = { 1,2,3,4,5 };
	std::cout << "Joining pairs with minimal cost\n\tElements: numbers 1-5\n";
	std::cout << "Cost of joining pairs: " << MinimumJoinPairs(values, 5) << "\n\n";

	// Knapsack Problem - problem plecakowy
	KnapsackProblem();



	return 0;
}


int MinimumJoinPairs(int* tab, int n) {
	// Minimalisation of joining pairs
	int result = 0;
	do {
		// 1. find minimum and almost minimum
		int minIndex1, minIndex2;
		int minValue = 10000;
		for (int i = 0; i < n; i++)
		{
			if (tab[i] < minValue) {
				minValue = tab[i];
				minIndex1 = i;
			}
		}
		minValue = 10000;
		for (int i = 0; i < n; i++)
		{
			if (minIndex1 == i) continue;
			if (tab[i] < minValue) {
				minValue = tab[i];
				minIndex2 = i;
			}
		}
		//std::cout << minIndex1 << ", " << minIndex2 << endl;

		// 2. join 2 chosen elements
		tab[minIndex1] += tab[minIndex2];
		result += tab[minIndex1];

		// 3. reorganise table for further work
		tab[minIndex2] = tab[n - 1];
		n--;
	} while (n > 1);
	return result;
}

void KnapsackProblem() {
	// Knapsack problem - problem plecakowy
	// example data
	ToPack tab[7];
	int n = 7;
	int capacity = 51;
	for (int i = 1; i <= n; i++)
	{
		tab[i - 1].weight = (!i % 3) ? (i - 4) * (i - 3) + 1 : (int)(cos(i * (i - 4) + 10) * 5 + 10);
		tab[i - 1].value = (i - 4) * (i - 5) + 1;
	}
	// display elements
	// Display(tab, n);
	// std::cout << "---\n";

	// sort by value/weight ratio
	for (int i = 0; i < n - 1; i++)
	{
		for (int j = i; j < n; j++)
		{
			if (Ratio(tab[i]) < Ratio(tab[j])) {
				ToPack pom = tab[i];
				tab[i] = tab[j];
				tab[j] = pom;
			}
		}
	}

	Display(tab, n);
	double weightSum = 0;
	double valueSum = 0;
	int i = 0;
	// general knapsack problem - unlimited items
	std::cout << "\nGeneral knapsack problem\n";
	while (weightSum <= capacity) {
		if (i >= n) break;
		int amount = (int)((capacity - weightSum) / tab[i].weight);
		weightSum += tab[i].weight * amount;
		valueSum += tab[i].value * amount;
		if (amount) std::cout << "Packed: " << i << ", " << amount << " times.\n";
		i++;
	}
	std:cout << "Summary: final value equals " << valueSum << ", weight " << weightSum << "/" << capacity << "\n\n";



	// knapsack problem using dynamic programming, see also: Bellman's principle of optimality
	// choosing the most optimal solution in given moment considering previous operations.
	// this approach does not need sorting elements.
	std::cout << "General knapsack problem - using dynamic programming\n";
	// values[n][weight], idNumbers[n][weight]
	n = 7;
	capacity = 51; // for following has to be of a integer type

	double** values = new double* [n+1];
	int** idNumbers = new int* [n+1];
	for (int i = 0; i <= n; i++) {
		values[i] = new double[capacity+1];
		idNumbers[i] = new int [capacity+1];
	}
	for (int i = 0; i <= n; i++)
	{
		for (int j = 0; j <= capacity; j++)
		{
			values[i][j] = 0;
			idNumbers[i][j] = 0;
		}
	}

	// 1. filling tables with data
	for (int i = 1; i <= n; i++)
	{
		for (int j = 1; j <= capacity; j++)
		{
			int currentValue = (int)(values[i][(int)(j - tab[i].weight)] + tab[i].value);
			if (tab[i].weight <= j && currentValue > values[i-1][j])
			{
				values[i][j] = currentValue;
				idNumbers[i][j] = i;
			}
			else
			{
				values[i][j] = values[i - 1][j];
				idNumbers[i][j] = idNumbers[i - 1][j];
			}
		}
	}
	// 2. reading results
	int index = 1, j = capacity;
	int totalValue = values[i][j];
	for (int i = 2; i <= n; i++)
	{
		int v = values[i][j];
		if (values[i][j] > totalValue) {
			totalValue = values[i][j];
			index = i;
		}
	}
	int packedWeight = 0;
	while (true) {
		int id = idNumbers[index][j - packedWeight];
		if (packedWeight + tab[id].weight <= capacity)
		{
			packedWeight += tab[id].weight;
			std::cout << "Packed: " << id << "\n";
		}
		else
		{
			std::cout << "Summary: final value equals " << totalValue << ", weight " << packedWeight << "/" << capacity << ".\n\n";
			break;
		}
	}
}
