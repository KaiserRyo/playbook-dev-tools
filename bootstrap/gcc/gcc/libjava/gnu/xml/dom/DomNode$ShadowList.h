
// DO NOT EDIT THIS FILE - it is machine generated -*- c++ -*-

#ifndef __gnu_xml_dom_DomNode$ShadowList__
#define __gnu_xml_dom_DomNode$ShadowList__

#pragma interface

#include <java/lang/Object.h>
extern "Java"
{
  namespace gnu
  {
    namespace xml
    {
      namespace dom
      {
          class DomNode;
          class DomNode$LiveNodeList;
          class DomNode$ShadowList;
      }
    }
  }
  namespace org
  {
    namespace w3c
    {
      namespace dom
      {
          class Node;
      }
    }
  }
}

class gnu::xml::dom::DomNode$ShadowList : public ::java::lang::Object
{

public: // actually package-private
  DomNode$ShadowList(::gnu::xml::dom::DomNode *, ::java::lang::String *, ::java::lang::String *);
public:
  void finalize();
  ::org::w3c::dom::Node * item(jint);
  jint getLength();
private:
  ::gnu::xml::dom::DomNode$LiveNodeList * __attribute__((aligned(__alignof__( ::java::lang::Object)))) liveList;
public: // actually package-private
  ::gnu::xml::dom::DomNode * this$0;
public:
  static ::java::lang::Class class$;
};

#endif // __gnu_xml_dom_DomNode$ShadowList__
