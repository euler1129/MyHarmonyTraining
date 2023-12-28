// Author: xjf
// Version: 1.0.0
// Description:
// CreateDateTime: 2023-12-24 22:46

#include "napi/native_api.h"
#include "VectorMatUtils.h"

string co1::convertToString(vector<Mat> numbers) {
    std::ostringstream oss;

    for (const auto& number : numbers) {
        if (!number.empty()) {
            int rows = number.rows;
            int cols = number.cols * number.channels();

            const uchar *dataPtr = number.data;
            for (int i = 0; i < rows; ++i) {
                for (int j = 0; j < cols - 1; ++j) {
                    oss << static_cast<int>(*(dataPtr + i * cols + j)) << ", ";
                }
                oss << static_cast<int>(*(dataPtr + i * cols + cols - 1));
                oss << ((i != rows - 1) ? "," : "") << "\n";
            }
        } else {
            oss << "[ ]\n";
        }
        oss << "\n";
    }

    return oss.str();
}
