#include <string>

class BaseType {
public:
	virtual ~BaseType() {};
	virtual void getValue(char *ret) = 0;
};

class CharType : public BaseType {
public:
	// using BaseType::getValue;
	void getValue(char *ret);
private:
	char value[255];
};

void CharType::getValue(char *ret) {
	printf("CHAR BOOM!\n");

	strcpy(value, "CHAR");
	strcpy(ret, value);
}

int main() {
  printf("Test project\n");

  BaseType *b = new CharType();

  char val[255];
  b->getValue(val);
  printf("%s\n", val);

  return 0;
}
