/**
 * Created with IntelliJ IDEA.
 * User: ttmtsmc
 * Date: 22/06/15
 * Time: 09:32
 * To change this template use File | Settings | File Templates.
 */
package
{
  import flash.events.Event;
  import flash.events.HTTPStatusEvent;
  import flash.events.IOErrorEvent;
  import flash.events.ProgressEvent;
  import flash.events.SecurityErrorEvent;
  import flash.net.URLLoader;
  import flash.net.URLRequest;
  import flash.net.URLRequestMethod;
  import flash.net.URLVariables;

  import mx.core.Application;
  import mx.events.FlexEvent;

  public class CustomApplication extends Application
  {
    private var loader:URLLoader;

    public function CustomApplication()
    {
      loader = new URLLoader();
      loader.addEventListener(Event.COMPLETE, completeHandler);
      loader.addEventListener(Event.OPEN, openHandler);
      loader.addEventListener(ProgressEvent.PROGRESS, progressHandler);
      loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
      loader.addEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandler);
      loader.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);

      var request:URLRequest = new URLRequest("http://localhost:8080/app/login.jsp");

      var variables:URLVariables = new URLVariables();
      variables.userName = "admin";
      variables.userPassword = "obviouslyNotMyPassword";
      request.data = variables;

      request.method = URLRequestMethod.POST;

      try {
        loader.load(request);
        request.method = URLRequestMethod.GET;
        loader.load(request);
      } catch (error:Error) {
        trace("Unable to load requested document.");
      }

      addEventListener(FlexEvent.CREATION_COMPLETE, onCreationComplete);
    }

    private function onCreationComplete(pEvent:FlexEvent):void
    {
      trace("onCreationComplete.");
    }

    private function completeHandler(event:Event):void {
      var loader:URLLoader = URLLoader(event.target);
      trace("completeHandler: " + loader.data);
    }

    private function openHandler(event:Event):void {
      trace("openHandler: " + event);
    }

    private function progressHandler(event:ProgressEvent):void {
      trace("progressHandler loaded:" + event.bytesLoaded + " total: " + event.bytesTotal);
    }

    private function securityErrorHandler(event:SecurityErrorEvent):void {
      trace("securityErrorHandler: " + event);
    }

    private function httpStatusHandler(event:HTTPStatusEvent):void {
      trace("httpStatusHandler: " + event);
    }

    private function ioErrorHandler(event:IOErrorEvent):void {
      trace("ioErrorHandler: " + event);
    }
  }
}
