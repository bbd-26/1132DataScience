summary <- function(input_path, output_path) {
  # 讀取 CSV 檔案
  data <- read.table(
    input_path,
    sep = ',',
    header = TRUE
  )
  
  # 取得檔名，例如 "input1.csv"，再移除副檔名，得到 "input1"
  file_name <- basename(input_path)
  file_name <- tools::file_path_sans_ext(file_name)
  
  # 計算 weight 與 height 的最大值，並四捨五入到小數點後兩位
  max_weight <- round(max(data$weight), 2)
  max_height <- round(max(data$height), 2)
  
  # 建立結果資料框：第一行為標題，第二行為數值，欄位以逗號隔開
  result <- data.frame(set = file_name, weight = max_weight, height = max_height)

  # 輸出結果到 CSV，不加上雙引號
  write.csv(result, file = output_path, row.names = FALSE, quote = FALSE)
}


# 測試呼叫 (記得調整 input_path 與 output_path)
# summary("./example/input1.csv", "./example/output1.csv")


