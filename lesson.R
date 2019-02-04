# パッケージの読み込み
library(brms)
library(tidyverse)

# データはmpgを使う(ggplotに内包されているサンプルデータ)
data(mpg)
# 少しみてみる
mpg
# ヘルプで確認
?mpg

# エンジンの排気量displで市街地における燃費の関係を見てみよう
g <- ggplot(mpg,aes(x=displ,y=cty))+geom_point()
plot(g)

g <- g + geom_smooth(method='lm')
plot(g)

#この回帰分析を最尤法でとくと

summary(lm(cty~displ,data=mpg))


# 同じことをベイズ推定すると

result.brm <- brm(cty~displ,data=mpg)
result.brm
plot(result.brm)

