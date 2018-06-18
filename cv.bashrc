cvcpl()
{
g++ $1 `pkg-config --cflags --libs opencv`
}
