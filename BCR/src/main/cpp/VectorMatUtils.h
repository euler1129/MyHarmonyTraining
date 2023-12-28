// Author: xjf
// Version: 1.0.0
// Description: 
// CreateDateTime: 2023-12-24 22:40

#ifndef MyHarmonyTraining_VectorMatUtils_H
#define MyHarmonyTraining_VectorMatUtils_H

#include "napi/native_api.h"

#include "opencv2/opencv.hpp"
#include "vector"

using namespace cv;
using namespace std;

namespace co1 {

    string convertToString(vector<Mat> numbers);

}

//class VectorMatUtils {
//
//public:
//    static string convertToString(vector<Mat> numbers);
//    
//};

#endif //MyHarmonyTraining_VectorMatUtils_H
