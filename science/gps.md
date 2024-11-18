---
layout: page
category: physics
---

# GPS

Есть сведения, что в работе GPS используются поправки на релятивизм:

- [https://www.astronomy.ohio-state.edu/pogge.1/Ast162/Unit5/gps.html](https://www.astronomy.ohio-state.edu/pogge.1/Ast162/Unit5/gps.html)
- [https://link.springer.com/article/10.12942/lrr-2003-1](https://link.springer.com/article/10.12942/lrr-2003-1)
- [https://en.wikipedia.org/wiki/Hafele%E2%80%93Keating_experiment](https://en.wikipedia.org/wiki/Hafele%E2%80%93Keating_experiment)


Ответы специалистов https://viictor.livejournal.com/210375.html

Еще ответ https://physics.stackexchange.com/questions/1061/why-does-gps-depend-on-relativity

> But what's relevant for GPS is the difference between timestamps from different satellites, right? And since they are on the same altitude they should be time shifted by the same amount, so the differences should be basically the same as without relativity. I mean it doesn't matter how much the error in the clocks is after a day, since the localization error is not cumulative, because the satellites' clocks don't drift away from each other. – 
isarandi Jun 14, 2015 at 

> Lots of misinformation here. As per the US Naval Observatory (the creators of GPS to replace LORAN): GPS does NOT use relativity calculations at all (repeat, it does NOT use relativity calculations). – 
MC9000  Jan 16, 2019 at 0:26

> @MC9000 - This is actually a common misconception about GPS. See for example here. The point is that instead of calculations directly based on general relativity, much simpler corrections are used to approximate those, as long as the receiver is only slowly moving on the surface of the planet. – 
Jirka Hanika May 6, 2019 at 10:03



## Хороший ответ

https://physics.stackexchange.com/questions/1061/why-does-gps-depend-on-relativity

There's the article from Ohio State University http://www.astronomy.ohio-state.edu/~pogge/Ast162/Unit5/gps.html which explains quite well why the clocks on a GPS satellite are faster by about 38 microseconds every day. The article then claims that not compensation for these 38 microseconds per day would cause a GPS to be off by about 11 km per day, plainly unusable, and claims that this (the fact that we need to compensate for the 38 microseconds to get GPS working) is proof for General Relativity.

The problem is that while the clocks are indeed off by 38 microseconds per day and General Relativity is all fine, we wouldn't actually have to compensate for it. The GPS in your car or your phone doesn't have an atomic clock. It doesn't have any clock precise enough to help with GPS. It doesn't measure how long the signal took to get from satellite A to GPS. It measures the difference between the signal from satellite A and the signal from satellite B (and two more satellites). This works if the clocks are fast: As long as they are all fast by the exact same amounts, we still get the right results.

That is, almost. Satellites don't stand still. So if we rely on a clock that is 38 microseconds fast per day, we do the calculations based on the position of a satellite that is off by 38 microseconds per day. So the error is not (speed of light times 38 microseconds times days), it is (speed of satellite times 38 microseconds times day). This is about 15 cm per day. Well, satellite positions get corrected once a week. I hope nobody thinks we could predict the position of a satellite for long time without any error.

Back to the original assumption, that without compensation the error would be 11km per day: The satellite clocks are multiplied by a factor just shy of 1 so that they go at the correct speed. But that wouldn't work. The effect that produces 38 microseconds per day isn't constant. When the satellite flies over an ocean, gravity is lower. The satellite speed changes all the time because the satellite doesn't fly on a perfect circle around a perfectly round earth made of perfectly homogenous material. If GR created an error of 11km per day uncompensated, then it is quite unconceivable that a simple multiplication of the clock speed would be good enough to reduce this to make GPS usable.

[[gps_real_world_relativity|Real-World Relativity]]

