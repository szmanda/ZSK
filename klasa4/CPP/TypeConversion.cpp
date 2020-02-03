#include <iostream>
#include <fstream>
#include <string>


using namespace std;

int main()
{
	// string conversions

	// 1. file input
	// requires <fstream>
		fstream fileObj;
		string allLines[1000];
		fileObj.open("TypeConversion.cpp", ios::in);
		if (fileObj.good())
		{
			int i = 0;

			while (!fileObj.eof())
			{
				string line;
				getline(fileObj, line); // requires <string>
				if (i<10)
					cout<<line<<endl;
				allLines[i] = line;
				i++;
			}
			fileObj.close();
		}

	// 2. file output
	// requires <fstream>
		fstream fileObj2;
		string output[4] = {"12","34","45","56"};
		fileObj2.open("output.txt", ios::out);
		if (!fileObj2) {
			// error
			cout << "error";
		}
		else {
			// write data into file:
			for (int i = 0; i < 4; i++)
				fileObj2 << output[i] << endl;
			fileObj2.close();
		}


	// 3. string conversion
	// requires <string>
		// a. number to string
			int integer = 94605;
			string s1 = std::to_string(34);
			cout << s1 << endl;


		// b. string to number
			string s2 = "32537";
			integer = stoi(s2);
			cout << integer << endl;

			string s3 = "6AE0";
			integer = stoi(s3, 0, 16); //hexadecimal interpretation and parse to int
			cout << integer << endl;

		//similarly:
			double num1 = stod("78.045");
			float num2 = stof("13.6");
			long num3 = stol("153");
			long double num4 = stold("168.5");
			cout << num1 << ";" << num2 << ";" << num3 << ";" << num4 << endl;


	return 0;
}
