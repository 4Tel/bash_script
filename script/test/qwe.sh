#!/bin/bash

# 파일 내용을 배열로 읽는 함수
read_file_to_array() {
    local filename="$1"
    local IFS=$'\n'  # 줄바꿈을 구분자로 설정
    local content

    # 파일이 존재하는지 확인
    if [[ ! -f "$filename" ]]; then
        echo "파일이 존재하지 않습니다: $filename" >&2
        return 1
    fi

    # 파일 내용을 읽어 배열로 저장
    #content=($(< "$filename"))
		content=($(cat "$filename"))
    # 배열의 내용을 출력 (이를 통해 함수의 "반환값"을 만듦)
    printf '%s\n' "${content[@]}"
}

# 함수 호출 및 결과를 새 배열에 저장
#readarray -t my_array < <(read_file_to_array "args.txt")
my_array="$(read_file_to_array "args.txt")"
# 결과 확인
echo "파일 내용:"
for line in "${my_array[@]}"; do
    echo "$line"
done
