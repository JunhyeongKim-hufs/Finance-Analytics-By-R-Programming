### 흐름제어문 ### 

## if & ifelse문 ##

# 같은 if & ifelse문 예시 

#condition 1개인 경우 
x <- 3
if (x > 2) {
  y <- 2*x
  z <- 4*x
} else {
  y <- 3*x
}

y    # x에 3할당, x가 2보다 크면 y는 2*x, (z 또한 추가로 입력 가능)
z

y <- ifelse (x>2, 2*x, 3*x)    #위와 같은 if문을 ifelse문으로 한줄표현 가능
y

#condition 2개인 경우  
x=3
if (x < -1) {
  y <- -1
} else if (x < 0) {
  y <- 0
} else {
  y <- 1
}
 
y              #condition이 2개인 경우 ifelse문을 사용할 수 없다.

##For 반복문## 

#1 
for (x in 1:4) {
  print(x)
}


## 연습문제 for문 


#1. x벡터값에 행번호를 넣어보자.

x <- rep(1,100)  #rep함수의 뜻 : 1을 100번 반복해서 벡터를 만들어라.

for (i in 1:100) {
  x[i] <- i
}
x 


#2. 1부터 100까지 정수를 차례대로 더해보자. 

x <- rep(1,100)  # 1을 100번 반복해서 벡터를 만들어라.

for (i in 2:100) {
  x[i] <- x[i-1] + i 
}                   #i변수를 2~100까지의 벡터로 정의. ex) x[2]=x[1]+2=1+2 

x

#3. 실습 (피보나치 수열) x_n = x_n-2 + x_n-1 , n = 3,4,5 ... / x_1=1, x_2=1 

#내 풀이 
x <- rep(1,30)      #자꾸 rep(1:30) 이렇게 : 사용하는 것 주의하기 용도 : 자리를 잡아줌

for (i in 3:30) {
  x[i] <- x[i-2] + x[i-1]
}

x


#4. 실습 For and if  (BMI data 계산 및 분석)

#내 풀이 
weigh <- c(60,72,57,90,95,72)
heigh <- c(1.75,1.80,1.65,1.90,1.74,1.91)

BMI <- weigh/(heigh)^2 

BMI

BMIID <- c(1:5)

if (BMI =< 18.5) {
  BMIID = 1
} else if (18.5 < BMI =< 24.9) {
  BMIID = 2
} else if (24.9 < BMI =< 29.9) {
  BMIID = 3
} else if (29.9 < BMI =< 30.0) {
  BMIID = 4
} else if (30 < BMI > 30) { 
  BMIID = 5
}

# 나에게 계속 오류가 뜨는 이유? 아무래도 변수를 설정하는 과정이 너무 미숙하다. 


### 교수님 풀이
weigh <- c(60,72,57,90,95,72)
heigh <- c(1.75,1.80,1.65,1.90,1.74,1.91)

BMI <- weigh/(heigh)^2 

BMIID <- rep(0,length(weigh))  #BMIID 자리잡기 / 계산이 안 된 부분은 0으로 확인해볼 수 있음.

#일단 부등호 방향이 <=인데 나는 =<로 잘못 썼음

for (i in 1:length(weigh)) {
  if (BMI[i]<= 18.5) {
    BMIID[i] <- 1
  } 
  else if (BMI[i] <= 24.9) { 
    BMIID[i] <- 2
  } 
  else if (BMI[i] <= 29.9) { 
    BMIID[i] <- 3
  }
  else if (BMI[i] <= 30.0) { 
      BMIID[i] <- 4
  }
  else {BMIID[i] <- 5
  }
}

data2 <- BMI[BMIID == 3 | BMIID == 4]
data1 <- BMI[BMIID == 1 | BMIID == 5]

#만약, weigh과 heigh을 함께 뽑아달라고 한다면? 

data <- data.frame(weigh, heigh, BMI, BMIID)

data2 <- data[BMIID == 3 | BMIID == 4, ]  ## 모든 열 표시 
data1 <- data[BMIID == 1 | BMIID == 5, ]


#꼭 다시 풀어봐야할 문제 체크 


##예제 while()문 

#1. 1부터 5보다 작은값까지 print 하기 

x <- 1

while(x<5) {
  x <- x+1
  print(x)
}

### while문과 for문 차이점 : for문의 경우 i가 자동적으로 업데이트 된다. 


#2.break th loop when x=3  (강제종료 : break문)

x <- 1

while (x<5) {
  x <- x+1
  if (x==3) {
    break
  }
  print(x)
}

#3. Skip one step when x=3 (한 스텝 뛰어넘기 : next문)

x <- 1

while (x<5) {
  x <- x+1
  if (x==3) {
    next
  }
  print(x)
}



### 사용자 정의 함수 ### 

#예제 1. y=x^2 + 10 

jh <- function(x) {
  y <- x^2+10
  return(y)
}

jh(8)


#2. output이 여러개인 경우 (list 함수를 사용하여 출력하자!)

jh2 <- function(x) {
  y1 <- x^2+10
  y2 <- x^3-10
  list(y1=y1, y2=y2)
}

jh2(7)  #출력하게 되면 각각 다른 값이 나온다. 이를 할당할 수도 있음. 


A <- jh2(10)

A$y1
A$y2   #두 개의 값 중 원하는 값을 뽑아서 쓸 수 있다. 

#3. input이 여러개인 경우 (위와 마찬가지로.)

jh3 <- function(x1,x2) {
  y1 <- x1^2+10
  y2 <- x2^3-10
  list(y1=y1, y2=y2)
}

jh3(5,6)


##실습 Annuity 문제 

#기간 n, 적립액 R, 연이자율 i, 잔액은 b(balance) 이라고 가정하자.

annuity <- function(n,R,i) {
  
  b <- rep(0,n)  #b의 자리를 잡아줘야 한다. 
  
  for (x in 1:n) {
    b[x] <- R*(1+i)^(x-1)
  }
  
  y <- sum(b)
  return(y)
}

annuity(n=10, R=400, i=0.05)


#만약 공식을 알고 있다면? 

annuity2 <- function(n, R, i) {
  y <- (R*((1+i)^n-1))/i
  return(y)
}

annuity2(n=10, R=400, i=0.05)





























