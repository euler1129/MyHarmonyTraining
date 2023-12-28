#include "napi/native_api.h"

#include "cardocr.h"
//#include "VectorMatUtils.h"
//#include "opencv2/opencv.hpp"

//using namespace cv;
//using namespace std;

namespace co1 {

static napi_value Add(napi_env env, napi_callback_info info) {
    size_t requireArgc = 2;
    size_t argc = 2;
    napi_value args[2] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);

    napi_valuetype valuetype1;
    napi_typeof(env, args[1], &valuetype1);

    double value0;
    napi_get_value_double(env, args[0], &value0);

    double value1;
    napi_get_value_double(env, args[1], &value1);

    napi_value sum;
    napi_create_double(env, value0 + value1, &sum);

    return sum;
}

static napi_value Rec(napi_env env, napi_callback_info info) {
    size_t requireArgc = 1;
    size_t argc = 1;
    napi_value args[1] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);

    char *buff = nullptr;
    size_t buff_size = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &buff_size);
    buff = new char[buff_size + 1];
    napi_get_value_string_utf8(env, args[0], buff, buff_size + 1, &buff_size);

    std::string filename = std::string(buff);

    //    // 1.load card image
    //    cv::Mat mat = cv::imread(filename);//"../resources/rawfile/card_n.png"
    //    cv::Mat converted = cv::Mat(mat.rows, mat.cols, CV_8UC4);
    //    //cv::cvtColor(mat, converted, COLOR_BGR2BGRA);
    //
    //    // 2.Contour enhancement (gradient enhancement)
    //    Rect card_area;
    //    co1::find_card_ocr(mat, card_area);
    //
    //    // 3.Crop and obtain bank card area
    //    Mat cart_mat(mat, card_area);
    //
    //    // 4.Crop bank card number area
    //    Rect card_number_area;
    //    co1::find_card_number_area(cart_mat, card_number_area);
    //
    //    Mat card_number_mat(mat, card_number_area);
    //
    //    // 5.Cropping of bank card number area
    //    vector<Mat> numbers;
    //    co1::find_card_numbers(card_number_mat, numbers);
    //
    //    const char* str = VectorMatUtils::convertToString(numbers).c_str();

    const char *str = "test";//co1::rec(filename);

    napi_value number;
    napi_create_string_utf8(env, str, strlen(str), &number);

    return number;
}

} // namespace co1

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "add", nullptr, co1::Add, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "rec", nullptr, co1::Rec, nullptr, nullptr, nullptr, napi_default, nullptr }    
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version =1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "BCR",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterBCRModule(void)
{
    napi_module_register(&demoModule);
}
