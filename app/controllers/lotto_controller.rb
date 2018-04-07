require ('open-uri')        # 웹 페이지 open 에 필요.
require ('json')            # JSON을 Hash로 변환하는데 필요.

class LottoController < ApplicationController
  def index
  end

  def pick_and_check
  	# page에 해당 웹 페이지를 열어서 저장. 
  	# page = open('http://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo=') 

  	# lotto_info 에 page 내용 (JSON 형식의 data) 을 읽어서 저장.
  	# lotto_info = page.read  

  	# lotto_hash 에 JSON 형식인 lotto_info 를 Hash 로 파싱(변환)하여 저장.
  	# lotto_hash = JSON.parse(lotto_info)    

  	# puts lotto_hash    #=> JSON 데이터가 Hash 로 변환되어 출력.

  	# 위의 주석된 코드들을 1줄로 줄인 코드! get_info에 hash가 저장되어있음.
  	get_info = JSON.parse open('http://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo=800').read

  	drw_numbers = []		# 이번주 당첨번호
    get_info.each do |k, v|
       drw_numbers << v if k.include? 'drwtNo'
    end
    drw_numbers.sort!
    bonus_number = get_info["bnusNo"]		#보너스번호
 
    # 여기서 부터 코드를 작성해 주세요. 로또 번호 6개 랜덤생성 후 정렬.
    # 이번주 당첨번호와 비교해서 1등부터 6등까지의 결과를 출력해내세요.
    
    random_vars = (1..45).to_a.sample(6)
    random_vars.sort!
    
    bet_num = (random_vars & drw_numbers)
    
      if bet_num.length == 6
      result = "1등"
      elsif (random_vars & (drw_numbers || bonus_number)).length == 6
      result = "2등"
      elsif bet_num.length == 5
      result = "3등"
      elsif bet_num.length == 4           
      result = "4등"
      elsif bet_num.length == 3
      result = "5등"
      else 
      result = "꽝"
      end
    












    # 인스턴스에 변수를 저장해주세요!
    @drw_numbers = drw_numbers
    @bonus_number = bonus_number
    @random_vars = random_vars
    @result = result
    @bet_num = bet_num
    # 추가생성한 변수들 인스턴스로 지정.

  end
end