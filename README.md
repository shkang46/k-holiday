# K-Holiday

[공공데이터포털](https://www.data.go.kr/)의 [한국천문연구원_특일정보](https://www.data.go.kr/data/15012690/openapi.do) API를 통해 공휴일 정보를 받아 
Holiday 오브젝트에 레코드를 생성하는 <strong>Invocable Method</strong> 제공
  
## Install
/packaging/installPackage.apexp?p0=`<versionId>`
|Version|Id|
|---|---|
|0.1.0.2|04t5i000000lqLDAAY|
|0.1.0.1|04t5i000000lqH0AAI|

## Settings

  1. [공공데이터포털](https://www.data.go.kr/) 가입
  2. [한국천문연구원_특일정보](https://www.data.go.kr/data/15012690/openapi.do)에서 활용신청
  3. 마이페이지 > 개인 API인증키 > 인증키 복사(Decoding)
  4. Salesforce > Setup > Custom Settings > K-Holiday Credentials > Manage > New on Default Organization Level Value > Service Key 붙여넣기 > Save

## Usage
Flow `Schedule Invoke Holiday Updater` 참고

### Input
|Name|Type|Example|
|---|---|---|
|year|number|2023|
|month|number|5|
